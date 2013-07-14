/*
 * Froid's Transmogrification System
 *
 * Do not use without explicit permission
 */

#include "Database/DatabaseEnv.h"
#include "ObjectMgr.h"
#include "SharedDefines.h"
#include "Transmog.h"

Transmogrification::Transmogrification()
{
}

void Transmogrification::Initialize()
{
    sLog.outString("Deleting non-existant transmogrification entries...");
    CharacterDatabase.Execute("DELETE FROM transmogrified_items WHERE NOT EXISTS (SELECT 1 FROM item_instance WHERE item_instance.guid = transmogrified_items.guid)");

    m_transmogMap.clear();
    QueryResult* result = CharacterDatabase.Query("SELECT guid, displayEntry FROM transmogrified_items WHERE EXISTS (SELECT 1 FROM item_instance WHERE item_instance.guid = transmogrified_items.guid)");
    if(result)
	    do
	    {
		    uint32 itemGuid = (*result)[0].GetUInt32();
	        uint32 displayEntry = (*result)[1].GetUInt32();
	        if(sObjectMgr.GetItemPrototype(displayEntry))
			    m_transmogMap[itemGuid] = displayEntry;
			else
			{
                sLog.outErrorDb("[Transmogrification] Item Entry (Entry: %u, GUID: %u) does not exist, deleting...", displayEntry, itemGuid);
                CharacterDatabase.PExecute("DELETE FROM transmogrified_items WHERE guid = %u", itemGuid);
			}
        } while (result->NextRow());
}

// Fetch the entry of the displayed item from the guid of the real item
uint32 Transmogrification::GetDisplayItemEntry(uint32 guidLow)
{
	TransmogMap::const_iterator itr = m_transmogMap.find(guidLow);
	if(itr == m_transmogMap.end())
	    return NULL;

	return itr->second;
}

// If the item exists in the transmog table, it must be deleted
void Transmogrification::DeleteItemFromDB(uint32 guidLow)
{
    QueryResult* findEntry = CharacterDatabase.PQuery("SELECT * FROM transmogrified_items WHERE guid = '%u'", guidLow);
    if(findEntry) // So it exists!
	{
		m_transmogMap.erase(guidLow);
	    static SqlStatementID delTransmogItem ;
	    SqlStatement stmt = CharacterDatabase.CreateStatement(delTransmogItem, "DELETE FROM transmogrified_items WHERE guid = ?");
	    stmt.PExecute(guidLow);
	}
}

bool Transmogrification::ProperItemQuality(Item* transmogItem)
{
    // Todo: make customizable in the config
    ItemPrototype const* proto = transmogItem->GetProto();
    if(!proto)
		return false;

	bool qualityResult;
	switch(proto->Quality)
	{
	    case ITEM_QUALITY_POOR:
		case ITEM_QUALITY_NORMAL:
			qualityResult = false;
			break;
		default:
			qualityResult = true;
			break;
	}
	return qualityResult;
}

uint32 Transmogrification::CanBeTransmogrified(Item* originalItem, Item* displayItem, Player* owner)
{
    if(!ProperItemQuality(originalItem))
        return ERROR_ORIGINAL_ITEM_QUALITY; // The original item has a bad quality
    if(!ProperItemQuality(displayItem))
        return ERROR_DISPLAY_ITEM_QUALITY; // The new display item has a bad quality

    if(originalItem->GetProto()->DisplayInfoID == displayItem->GetProto()->DisplayInfoID) // Same display ID's
        return ERROR_ITEMS_HAVE_SAME_DISPLAY;

    if(owner->CanUseItem(displayItem) != EQUIP_ERR_OK)
        return ERROR_CANNOT_USE_ITEM;

    // Info for the original item
    uint32 originalItemClass    = originalItem->GetProto()->Class;
    uint32 originalItemSubClass = originalItem->GetProto()->SubClass;
    uint32 originalItemInvType  = originalItem->GetProto()->InventoryType;

    // Info for the display item
    uint32 displayItemClass    = displayItem->GetProto()->Class;
    uint32 displayItemSubClass = displayItem->GetProto()->SubClass;
    uint32 displayItemInvType  = displayItem->GetProto()->InventoryType;

    if(originalItemClass != displayItemClass)
        return ERROR_BAD_CLASS; // Self-explanatory

    if(displayItemClass == ITEM_CLASS_WEAPON && displayItemSubClass != ITEM_SUBCLASS_WEAPON_FISHING_POLE
       && originalItemSubClass != ITEM_SUBCLASS_WEAPON_FISHING_POLE)
    {
        if(originalItemSubClass == displayItemSubClass
                || ((displayItemSubClass == ITEM_SUBCLASS_WEAPON_BOW || displayItemSubClass == ITEM_SUBCLASS_WEAPON_CROSSBOW
                || displayItemSubClass == ITEM_SUBCLASS_WEAPON_GUN) && (originalItemSubClass == ITEM_SUBCLASS_WEAPON_BOW
                || originalItemSubClass == ITEM_SUBCLASS_WEAPON_CROSSBOW || originalItemSubClass == ITEM_SUBCLASS_WEAPON_GUN)))
            if(originalItemInvType == displayItemInvType ||
               (displayItemInvType == INVTYPE_WEAPON && (originalItemInvType == INVTYPE_WEAPONMAINHAND || originalItemInvType == INVTYPE_WEAPONOFFHAND)))
                return SUCCESS_FOR_TRANSMOG;
            else
                return ERROR_BAD_INVENTORY_TYPE;
        else
            return ERROR_BAD_SUBCLASS;
    }
    else if(displayItemClass == ITEM_CLASS_ARMOR)
    {
        if(displayItemSubClass == originalItemSubClass) // in the case of armor - mail, plate, cloth, etc.
            if(displayItemInvType == originalItemInvType || (displayItemInvType == INVTYPE_CHEST && originalItemInvType == INVTYPE_ROBE)
               || (displayItemInvType == INVTYPE_ROBE && originalItemInvType == INVTYPE_CHEST))
                return SUCCESS_FOR_TRANSMOG;
            else
                return ERROR_BAD_INVENTORY_TYPE;
        else
            return ERROR_BAD_SUBCLASS;
    }

    return ERROR_BAD_CLASS;
}

void Transmogrification::EnableTransmog(uint32 guidLow, uint32 displayItem, Player* owner, uint8 slot)
{
    owner->SetUInt32Value(PLAYER_VISIBLE_ITEM_1_ENTRYID + (slot * 2), displayItem);
    m_transmogMap[guidLow] = displayItem; // Bind the guid of the item to the new display item id
    CharacterDatabase.PExecute("REPLACE INTO transmogrified_items (guid, displayEntry) VALUES (%u, %u)", guidLow, displayItem);
}

bool Transmogrification::DisableTransmog(Item* originalItem, Player* owner, uint8 slot)
{
    uint32 guidLow = originalItem->GetGUIDLow();
    uint32 displayEntry = GetDisplayItemEntry(guidLow);
    if(!displayEntry)
        return false;

    owner->SetUInt32Value(PLAYER_VISIBLE_ITEM_1_ENTRYID + (slot * 2), originalItem->GetEntry());
    DeleteItemFromDB(guidLow);
    return true;
}

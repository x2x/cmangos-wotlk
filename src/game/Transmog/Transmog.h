/*
 * Froid's Transmogrification System
 *
 * Do not use without explicit permission
 */

#ifndef _TRANSMOG_H
#define _TRANSMOG_H

#include "Bag.h"
#include "Item.h"
#include "Language.h"
#include "Player.h"
#include "World.h"

// For Transmogrification::CanBeTransmogrified() check
enum TransmogrifyAttemptResults
{
    ERROR_ORIGINAL_ITEM_QUALITY,
    ERROR_DISPLAY_ITEM_QUALITY,
    ERROR_ITEMS_HAVE_SAME_DISPLAY,
    ERROR_CANNOT_USE_ITEM,
    ERROR_BAD_CLASS,
    ERROR_BAD_SUBCLASS,
    ERROR_BAD_INVENTORY_TYPE,
    SUCCESS_FOR_TRANSMOG
};

class Transmogrification
{
    public:
    	Transmogrification();

        void Initialize();
        void DeleteItemFromDB(uint32 guidLow);
		uint32 GetDisplayItemEntry(uint32 guidLow);
		uint32 CanBeTransmogrified(Item* originalItem, Item* displayItem, Player* owner);


		// Use these two functions as the main interfaces for transmog.
		void EnableTransmog(uint32 guidLow, uint32 displayItem, Player* owner, uint8 slot);
		bool DisableTransmog(Item* originalItem, Player* owner, uint8 slot);

        // Checks used in the transmogrification system
        bool ProperItemQuality(Item* transmogItem);
		bool IsEnabled() { return sWorld.getConfig(CONFIG_BOOL_TRANSMOG_ENABLED); }

	private:
        typedef UNORDERED_MAP<uint32, uint32> TransmogMap;
        TransmogMap m_transmogMap;
};

#define sTransmogrification MaNGOS::Singleton<Transmogrification>::Instance()

#endif

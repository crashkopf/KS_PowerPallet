#define ASH_AUGER_PERIOD_DEFAULT 3000
#define ASH_AUGER_LENGTH_DEFAULT 1500

#define FET_ASH_AUGER FET5

typedef enum {
	ASH_AUGER_ON,
	ASH_AUGER_OFF
} ashAugerRunState_t;

typedef enum {
	ASH_AUGER_AUTO,
	ASH_AUGER_MANUAL,
	ASH_AUGER_DISABLED
} ashAugerControlState_t;
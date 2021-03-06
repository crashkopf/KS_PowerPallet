#define RELEASE_DEVELOPMENT 0
#define RELEASE_TESTING 1
#define RELEASE_PRODUCTION 2
//#define RELEASE_CYCLE RELEASE_DEVELOPMENT

// #define V_MAJOR "1"
// #define V_MINOR "0"
// #define V_MAINT "0"
// #define V_BUILD "0"

#if RELEASE_CYCLE == RELEASE_PRODUCTION
#define CODE_VERSION "v" V_MAJOR "." V_MINOR "." V_MAINT
#else
#define CODE_VERSION "v" V_MAJOR "." V_MINOR "-dev, build " V_BUILD
#endif
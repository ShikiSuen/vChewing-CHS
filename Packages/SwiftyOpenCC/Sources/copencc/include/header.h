#include <stdint.h>

#ifdef __cplusplus
extern "C"
{
#endif

// MARK: Error

enum CCErrorCode {
    CCErrorCodeFileNotFound = 1,
    CCErrorCodeInvalidFormat,
    CCErrorCodeInvalidTextDictionary,
    CCErrorCodeInvalidUTF8,
    CCErrorCodeUnknown,
} __attribute__((enum_extensibility(open)));

typedef enum CCErrorCode CCErrorCode;

CCErrorCode ccErrorno;

// MARK: CCDict

typedef void* CCDictRef;

CCDictRef _Nullable CCDictCreateDartsWithPath(const char * _Nonnull path);

CCDictRef _Nullable CCDictCreateMarisaWithPath(const char * _Nonnull path);

CCDictRef _Nonnull CCDictCreateWithGroup(CCDictRef _Nonnull * const _Nonnull dictGroup, intptr_t count);

void CCDictDestroy(CCDictRef _Nonnull dict);

// MARK: CCConverter

typedef void* CCConverterRef;

CCConverterRef _Nonnull CCConverterCreate(const char * _Nonnull name, CCDictRef _Nonnull segmentation, CCDictRef _Nonnull * const _Nonnull conversionChain, intptr_t chainCount);

void CCConverterDestroy(CCConverterRef _Nonnull dict);

typedef void* STLString;

STLString _Nullable CCConverterCreateConvertedStringFromString(CCConverterRef _Nonnull converter, const char * _Nonnull str);

const char* _Nonnull STLStringGetUTF8String(STLString _Nonnull str);

void STLStringDestroy(STLString _Nonnull str);

#ifdef __cplusplus
}
#endif

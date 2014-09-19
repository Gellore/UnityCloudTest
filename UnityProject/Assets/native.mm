#import <Foundation/Foundation.h>

extern "C"
{
	char* MakeStringCopy (const char* string)
	{
	    if (string == NULL)
	        return NULL;
	    
	    char* res = (char*)malloc(strlen(string) + 1);
	    strcpy(res, string);
	    return res;
	}

	char const* _GetBundleVersion()
    {
        NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        
        const char* result = MakeStringCopy ([version UTF8String]);
        return result;
    }
}
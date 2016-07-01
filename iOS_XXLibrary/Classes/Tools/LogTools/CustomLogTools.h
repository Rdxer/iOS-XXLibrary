//
//  CustomLogTools.h
//  custom Log
//
//  Created by LXF on 16/1/1.
//  Copyright © 2016年 LXF. All rights reserved.
//

#ifndef CustomLogTools_h
#define CustomLogTools_h


#define CodeInfo [NSString stringWithFormat:@"%s-%s-%zd",__FILE__,__PRETTY_FUNCTION__,__LINE__]

#define Xassert(condition, desc, ...) {\
if((condition) == NO){\
    NSString *str = [NSString stringWithFormat:desc,##__VA_ARGS__];    \
    LXFPrintf("💔",LXF_defaultColor,LXF_defaultColor,LXF_defaultColor,LXF_defaultColor,"🎉",@"断言失败 -> %@", str);\
    NSAssert(NO, str);\
}\
}

#define Xassert2(desc, ...)  Xassert(NO,desc,##__VA_ARGS__)


#define LXF_defaultColor "_"

#define NSLog(format, ...)   {\
LXFPrintf("😐",LXF_defaultColor,LXF_defaultColor,"00f",LXF_defaultColor,"🎉",format, ##__VA_ARGS__); \
}

// OK
#define printOK(format, ...)   {\
LXFPrintf("💯","#00F72C",LXF_defaultColor,"#00F72C",LXF_defaultColor,"🎉",format, ##__VA_ARGS__); \
}

// debug
#define printD(format, ...)   {\
LXFPrintf("😁","00f",LXF_defaultColor,"00f",LXF_defaultColor,"🎉",format, ##__VA_ARGS__); \
}

// Warning
#define printW(format, ...)   {\
LXFPrintf("⚠️","d84",LXF_defaultColor,"d84",LXF_defaultColor,"🎉",format, ##__VA_ARGS__); \
}

// error
#define printE(format, ...)   {\
LXFPrintf("❌","f00",LXF_defaultColor,"f00",LXF_defaultColor,"🎉",format, ##__VA_ARGS__); \
}

// print obj
#define printOBJ(obj)   {\
LXFPrintf("⚽️",LXF_defaultColor,LXF_defaultColor,LXF_defaultColor,LXF_defaultColor,"🎉",@"%@",obj); \
}


#define LXFPrintf(tag,titlefg,titlebg,contentfg,contentbg,split,format, ...)  {\
const char *fileName = [NSString stringWithUTF8String:__FILE__].lastPathComponent.UTF8String;\
const char *content = [[NSString stringWithFormat:format,##__VA_ARGS__]UTF8String];\
printf("$(%s,%d,%s,%s,%s,%s)%s%s + %d %s %s$(end)\n",fileName,__LINE__,titlefg,titlebg,contentfg,contentbg,tag,__PRETTY_FUNCTION__,__LINE__,split,content);\
}


#endif

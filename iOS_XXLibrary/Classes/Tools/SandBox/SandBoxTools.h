//
//  SandBoxTools.h
//  Pods
//
//  Created by Rdxer on 16/7/21.
//
//

#ifndef SandBoxTools_h
#define SandBoxTools_h

//Document目录
#define SanBoxDocumentDirectory NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

//Cache目录
#define SanBoxCachesDirectory NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject

//Libaray目录
#define SanBoxLibraryDirectory NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject

//tmp目录
#define SanBoxTemporaryDirectory NSTemporaryDirectory();

#endif /* SandBoxTools_h */

package
{
	/**
	 *@author T3
	 *xtygah14three@foxmail.com
	 *2015-2-16下午7:36:10
	 */
	public class ClassFileDefine
	{
		public static var  uPluginFile:String=
"{\r\n"+
"\"FileVersion\" : 1,\r\n"+	
"\"FriendlyName\" : \"tempName Friend Name\",\r\n"+
"\"Version\" : 13,\r\n"+
"\"VersionName\" : \"1.0\",\r\n"+
"\"CreatedBy\" :\"Your Organization\",\r\n"+
"\"CreatedByURL\" : \"http://google.com\",\r\n"+
"\"EngineVersion\" : \"4.5.0\",\r\n"+
"\"Description\" : \"Your Description \",\r\n"+
"\"Category\" : \"YouCategory.tools\",\r\n"+
	
"\"Modules\" :\r\n"+
" [\r\n"+
"   {\r\n"+
"     \"Name\" : \"tempNamePlugin\",\r\n"+
"     \"Type\" : \"Runtime\",\r\n"+
"    \"LoadingPhase\": \"PreDefault\"\r\n"+
"   }\r\n"+
" ]\r\n"+
"}\r\n"
	

  public static var buildCs:String=

  "using UnrealBuildTool;\r\n"+
  "using System.IO;\r\n"+
  
"namespace UnrealBuildTool.Rules\r\n"+
"{\r\n"+
"		public class tempNamePlugin : ModuleRules\r\n"+
"			{\r\n"+
"				public tempNamePlugin(TargetInfo Target)\r\n"+
"				{\r\n"+
"					PrivateIncludePaths.AddRange(\r\n"+
"						new string[] {\r\n"+
"							\"tempNamePlugin/Private\"\r\n"+
"						});\r\n"+
"					PublicIncludePaths.AddRange(\r\n"+
"						new string[] {\r\n"+ 
"							\"tempNamePlugin/Public\"\r\n"+
"						});\r\n"+
			  
"		           PublicDependencyModuleNames.AddRange(\r\n"+
"						new string[]\r\n"+
"							{\r\n"+
"								\"Core\",\r\n"+ 
"								\"CoreUObject\",\r\n"+ 
"								\"Engine\",\r\n"+ 
"								\"InputCore\",\r\n"+
"								\"RHI\",\r\n"+
"							});\r\n"+
"					}\r\n"+
"			}\r\n"+
"}\r\n"

public static var IPluginFileH:String=
"#pragma once\r\n"+
"#include \"ModuleManager.h\"\r\n"+
"class ItempNamePlugin :public IModuleInterface\r\n"+
"{\r\n"+
"	public:\r\n"+
"	static inline ItempNamePlugin& Get()\r\n"+
"	{\r\n"+
"		return FModuleManager::LoadModuleChecked< ItempNamePlugin >(\"tempNamePlugin\");\r\n"+
"	}\r\n"+
"	static inline bool IsAvailable()\r\n"+
"	{\r\n"+
"		return FModuleManager::Get().IsModuleLoaded(\"tempNamePlugin\");\r\n"+
"	}\r\n"+
"};\r\n"

public static var PCHF:String=
"#include \"ItempNamePlugin.h\"\r\n"+
"#include \"Kismet/BlueprintFunctionLibrary.h\"\r\n"+
"#include \"CoreUObject.h\"\r\n"+
"#include \"Engine.h\"\r\n"+
"#include \"EngineDefines.h\"\r\n"+
"#include \"Delegate.h\"\r\n"+
"#include \"ModuleManager.h\"\r\n"+
"#include \"tempNamePluginClasses.h\"\r\n"



public static var PluginHeader:String=
"#pragma  once\r\n"+
"#include \"ItempNamePlugin.h\"\r\n"+
"class FtempNamePluginImpl :public ItempNamePlugin\r\n"+
"{\r\n"+
"	void StartupModule();\r\n"+
"	void ShutdownModule();\r\n"+
"};"

public static var PluginBody:String=
"#include \"tempNamePluginPrivatePCH.h\"\r\n"+
"#include \"tempNamePlugin.h\"\r\n"+

"void FtempNamePluginImpl::StartupModule()\r\n"+
"{\r\n"+

"}\r\n"+
"void FtempNamePluginImpl::ShutdownModule()\r\n"+
"{\r\n"+
	
"}\r\n"+
"IMPLEMENT_MODULE(FtempNamePluginImpl, tempNamePlugin);\r\n"


//Class
public static var classHeader:String=
"#pragma once\r\n"+
"#include \"tempNamePluginPrivatePCH.h\"\r\n"+
"#include \"tempName.generated.h\"\r\n"+
"\r\n"+
"UCLASS()\r\n"+
"class TEMPNAMEPLUGIN_API UtempName : public UBlueprintFunctionLibrary\r\n"+
"{\r\n"+
"	GENERATED_UCLASS_BODY()\r\n"+
"//test function \r\n"+	
"	UFUNCTION(BlueprintCallable,Category=\"tempName|test\")\r\n"+
"	static void test();\r\n"+
"};\r\n"


public static var classBody:String=
"#include \"tempNamePluginPrivatePCH.h\"\r\n"+
"#include \"tempName.h\"\r\n"+

"UtempName::UtempName(const class FPostConstructInitializeProperties& PCIP)\r\n"+
"	: Super(PCIP)\r\n"+
"{\r\n"+
"\r\n"+	
"}\r\n"+
"void UtempName::test()\r\n"+
"{\r\n"+
"\r\n"+
"}\r\n"
  //////////////////////////
}
}
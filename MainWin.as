package
{
	import com.adobe.images.PNGEncoder;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.utils.ByteArray;
	
	/**
	 *@author T3
	 *xtygah14three@foxmail.com
	 *2015-2-16下午7:01:23
	 */
	public class MainWin extends MovieClip
	{
		public var drageTool:MovieClip;
		public var CreateBtn:SimpleButton;
		public var PluginNameTxt:TextField;
		
		private var fileRef:File;
		private var pluginName:String;
		
		[Embed(source="Icon128.png")]
		private var pngClass:Class;
		public function MainWin()
		{
			super();
			CreateBtn.addEventListener(MouseEvent.CLICK,onCreate);
		}
		private function onCreate(e:MouseEvent):void{
			pluginName=PluginNameTxt.text;
			fileRef=new  File();
			fileRef.addEventListener(Event.SELECT,onSelect);
			fileRef.browseForDirectory("Select a directory to save");
		}
		private function onSelect(e:Event):void{
			trace(fileRef.nativePath);
			
			var rootDir:String=fileRef.nativePath+"\\"+pluginName+"\\";
			var uPlugineFile:File=new File(rootDir+pluginName+".uplugin");
			var iconFile:File=new File(rootDir+"Resources\\Icon128.png");
			var buildCsFile:File=new File(rootDir+"Source\\"+pluginName+"Plugin\\"+pluginName+"Plugin.Build.cs");
			var IpluginHFile:File=new File(rootDir+"Source\\"+pluginName+"Plugin\\Public\\I"+pluginName+"Plugin.h");
			var pchFile:File=new File(rootDir+"Source\\"+pluginName+"Plugin\\Public\\"+pluginName+"PluginPrivatePCH.h");
			var pluginHeader:File=new File(rootDir+"Source\\"+pluginName+"Plugin\\Public\\"+pluginName+"Plugin.h");
			var pluginBody:    File=new File(rootDir+"Source\\"+pluginName+"Plugin\\Private\\"+pluginName+"Plugin.cpp");
			var clsHeader:File      =new File(rootDir+"Source\\"+pluginName+"Plugin\\Classes\\"+pluginName+".h");
			var clsBody:File          =new File(rootDir+"Source\\"+pluginName+"Plugin\\Classes\\"+pluginName+".cpp");
			
			var fileSteam:FileStream=new FileStream();
			
			//Uplugin文件
			var uPluginContent:String = ClassFileDefine.uPluginFile.replace(/tempName/g,pluginName);
			fileSteam.open(uPlugineFile,FileMode.WRITE);
			fileSteam.writeUTFBytes(uPluginContent);
			fileSteam.close();
			
			
			//图片
			var newPng:Bitmap=new pngClass() as Bitmap;
			fileSteam.open(iconFile,FileMode.WRITE);
			var byte:ByteArray=PNGEncoder.encode(newPng.bitmapData);
			fileSteam.writeBytes(byte);
			fileSteam.close();
			
			//Build.cs
			var buildCsContent:String=ClassFileDefine.buildCs.replace(/tempName/g,pluginName);
			fileSteam.open(buildCsFile,FileMode.WRITE);
			fileSteam.writeUTFBytes(buildCsContent);
			fileSteam.close();
			
			// Iplugin.h
			var IpluginHContent:String=ClassFileDefine.IPluginFileH.replace(/tempName/g,pluginName);
			fileSteam.open(IpluginHFile,FileMode.WRITE);
			fileSteam.writeUTFBytes(IpluginHContent);
			fileSteam.close();
			
			//PCHfILE
			var PchFileContent:String=ClassFileDefine.PCHF.replace(/tempName/g,pluginName);
			fileSteam.open(pchFile,FileMode.WRITE);
			fileSteam.writeUTFBytes(PchFileContent);
			fileSteam.close();
			
			//头文件
			var pluginHeaderContent:String=ClassFileDefine.PluginHeader.replace(/tempName/g,pluginName);
			fileSteam.open(pluginHeader,FileMode.WRITE);
			fileSteam.writeUTFBytes(pluginHeaderContent);
			fileSteam.close();
			//Cpp
			var pluginBodyContent:String=ClassFileDefine.PluginBody.replace(/tempName/g,pluginName);
			fileSteam.open(pluginBody,FileMode.WRITE);
			fileSteam.writeUTFBytes(pluginBodyContent);
			fileSteam.close();
			
			
			var clsHeaderContent:String=ClassFileDefine.classHeader.replace(/tempName/g,pluginName);
			var HightName:String=pluginName.toLocaleUpperCase();
			clsHeaderContent=clsHeaderContent.replace("TEMPNAME",HightName);
			fileSteam.open(clsHeader,FileMode.WRITE);
			fileSteam.writeUTFBytes(clsHeaderContent);
			fileSteam.close();
			
			var clsBodyContent:String=ClassFileDefine.classBody.replace(/tempName/g,pluginName);
			fileSteam.open(clsBody,FileMode.WRITE);
			fileSteam.writeUTFBytes(clsBodyContent);
			fileSteam.close();
			
		}
	}
}
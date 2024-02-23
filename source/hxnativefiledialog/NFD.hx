package hxnativefiledialog;

#if !cpp
#error 'Native File Dialog supports only C++ target platforms.'
#end
import hxnativefiledialog.Types;

@:buildXml('<include name="${haxelib:hxnativefiledialog}/project/Build.xml" />')
@:include('nfd.h')
@:unreflective
extern class NFD
{
	/* Single file open dialog */
	@:native('NFD_OpenDialog')
	static function OpenDialog(filterList:NFDConstCharStar_T, defaultPath:NFDConstCharStar_T, outPath:cpp.Star<NFDCharStar_T>):NFDResult_T;

	/* Multiple file open dialog */
	@:native('NFD_OpenDialogMultiple')
	static function OpenDialogMultiple(filterList:NFDConstCharStar_T, defaultPath:NFDConstCharStar_T, outPath:cpp.RawPointer<NFDPathSet_T>):NFDResult_T;

	/* Save dialog */
	@:native('NFD_SaveDialog')
	static function SaveDialog(filterList:NFDConstCharStar_T, defaultPath:NFDConstCharStar_T, outPath:cpp.Star<NFDCharStar_T>):NFDResult_T;

	/* Select folder dialog */
	@:native('NFD_PickFolder')
	static function PickFolder(defaultPath:NFDConstCharStar_T, outPath:cpp.Star<cpp.NFDCharStar_T>):NFDResult_T;

	/* Get last error -- set when nfdresult_t returns NFD_ERROR */
	@:native('NFD_GetError')
	static function GetError():NFDConstCharStar_T;

	/* Get the number of entries stored in pathSet */
	@:native('NFD_PathSet_GetCount')
	static function PathSet_GetCount(pathSet:cpp.RawConstPointer<NFDPathSet_T>):cpp.SizeT;

	/* Get the UTF-8 path at offset index */
	@:native('NFD_PathSet_GetPath')
	static function PathSet_GetPath(pathSet:cpp.RawConstPointer<NFDPathSet_T>, index:cpp.SizeT):cpp.CharStar;

	/* Free the pathSet */
	@:native('NFD_PathSet_Free')
	static function PathSet_Free(pathSet:cpp.RawPointer<NFDPathSet_T>):Void;
}

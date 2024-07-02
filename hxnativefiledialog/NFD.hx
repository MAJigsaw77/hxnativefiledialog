package hxnativefiledialog;

#if !cpp
#error 'Native File Dialog supports only C++ target platforms.'
#end
import hxnativefiledialog.Types;

/**
 * This class provides static methods to interact with the Native File Dialog (NFD) library.
 * It allows for the creation and management of file and folder dialogs, as well as handling
 * the retrieval of selected paths and error messages.
 */
@:buildXml('<include name="${haxelib:hxnativefiledialog}/project/Build.xml" />')
@:include('nfd.h')
@:unreflective
extern class NFD
{
	/**
	 * Open a single file dialog.
	 *
	 * @param filterList A semicolon-separated list of file filters, e.g., "png;jpg".
	 * @param defaultPath The default path for the dialog to open in.
	 * @param outPath Pointer to the output path selected by the user.
	 * @return Result of the operation (NFD_ERROR, NFD_OKAY, NFD_CANCEL).
	 */
	@:native('NFD_OpenDialog')
	static function OpenDialog(filterList:NFDConstCharStar_T, defaultPath:NFDConstCharStar_T, outPath:cpp.RawPointer<NFDCharStar_T>):NFDResult_T;

	/**
	 * Open a multiple file selection dialog.
	 *
	 * @param filterList A semicolon-separated list of file filters.
	 * @param defaultPath The default path for the dialog to open in.
	 * @param outPath Pointer to the output paths selected by the user.
	 * @return Result of the operation (NFD_ERROR, NFD_OKAY, NFD_CANCEL).
	 */
	@:native('NFD_OpenDialogMultiple')
	static function OpenDialogMultiple(filterList:NFDConstCharStar_T, defaultPath:NFDConstCharStar_T, outPath:cpp.RawPointer<NFDPathSet_T>):NFDResult_T;

	/**
	 * Open a save file dialog.
	 *
	 * @param filterList A semicolon-separated list of file filters.
	 * @param defaultPath The default path for the dialog to open in.
	 * @param outPath Pointer to the output path selected by the user.
	 * @return Result of the operation (NFD_ERROR, NFD_OKAY, NFD_CANCEL).
	 */
	@:native('NFD_SaveDialog')
	static function SaveDialog(filterList:NFDConstCharStar_T, defaultPath:NFDConstCharStar_T, outPath:cpp.RawPointer<NFDCharStar_T>):NFDResult_T;

	/**
	 * Open a folder selection dialog.
	 *
	 * @param defaultPath The default path for the dialog to open in.
	 * @param outPath Pointer to the output path selected by the user.
	 * @return Result of the operation (NFD_ERROR, NFD_OKAY, NFD_CANCEL).
	 */
	@:native('NFD_PickFolder')
	static function PickFolder(defaultPath:NFDConstCharStar_T, outPath:cpp.RawPointer<NFDCharStar_T>):NFDResult_T;

	/**
	 * Get the last error message.
	 * This function should be called if a function returns NFD_ERROR.
	 *
	 * @return The last error message.
	 */
	@:native('NFD_GetError')
	static function GetError():NFDConstCharStar_T;

	/**
	 * Get the number of entries in a path set.
	 *
	 * @param pathSet Pointer to the path set.
	 * @return The number of paths in the path set.
	 */
	@:native('NFD_PathSet_GetCount')
	static function PathSet_GetCount(pathSet:cpp.RawConstPointer<NFDPathSet_T>):cpp.SizeT;

	/**
	 * Get a path from a path set by index.
	 *
	 * @param pathSet Pointer to the path set.
	 * @param index The index of the path to retrieve.
	 * @return The path at the specified index.
	 */
	@:native('NFD_PathSet_GetPath')
	static function PathSet_GetPath(pathSet:cpp.RawConstPointer<NFDPathSet_T>, index:cpp.SizeT):NFDCharStar_T;

	/**
	 * Free the memory used by a path set.
	 *
	 * @param pathSet Pointer to the path set to free.
	 */
	@:native('NFD_PathSet_Free')
	static function PathSet_Free(pathSet:cpp.RawPointer<NFDPathSet_T>):Void;
}

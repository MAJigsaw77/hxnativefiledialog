package hxnativefiledialog;

/**
 * Dummy class for importing Native File Dialog types.
 */
#if !cpp
#error 'Native File Dialog supports only C++ target platforms.'
#end
class Types {}

/**
 * A UTF-8 character in the Native File Dialog library.
 */
@:buildXml('<include name="${haxelib:hxnativefiledialog}/project/Build.xml" />')
@:include('nfd.h')
@:native('nfdchar_t')
@:scalar
@:coreType
@:notNull
extern abstract NFDChar_T from Int to Int {}

/**
 * A pointer to a UTF-8 character in the Native File Dialog library.
 */
extern abstract NFDCharStar_T(cpp.RawPointer<NFDChar_T>) to cpp.RawPointer<NFDChar_T>
{
	inline function new(s:String):Void
		this = untyped s.__s;

	@:from
	static public inline function fromString(s:String):NFDCharStar_T
		return new NFDCharStar_T(s);

	@:to extern public inline function toString():String
		return new String(untyped this);

	@:to extern public inline function toPointer():cpp.RawPointer<NFDChar_T>
		return this;
}

/**
 * A constant pointer to a UTF-8 character in the Native File Dialog library.
 */
extern abstract NFDConstCharStar_T(cpp.RawConstPointer<NFDChar_T>) to cpp.RawConstPointer<NFDChar_T>
{
	inline function new(s:String):Void
		this = untyped s.__s;

	@:from
	static public inline function fromString(s:String):NFDConstCharStar_T
		return new NFDConstCharStar_T(s);

	@:to extern public inline function toString():String
		return new String(untyped this);

	@:to extern public inline function toPointer():cpp.RawConstPointer<NFDChar_T>
		return this;
}

/**
 * An opaque data structure for managing paths in the Native File Dialog library.
 */
@:buildXml('<include name="${haxelib:hxnativefiledialog}/project/Build.xml" />')
@:include('nfd.h')
@:unreflective
@:structAccess
@:native('nfdpathset_t')
extern class NFDPathSet_T
{
	function new():Void;

	var buf:NFDCharStar_T;
	var indices:cpp.RawPointer<cpp.SizeT>; // byte offsets into buf
	var count:cpp.SizeT; // number of indices into buf
}

/**
 * Result codes from the Native File Dialog operations.
 */
extern enum abstract NFDResult_T(NFDResult_T_Impl)
{
	/**
	 * Programmatic error
	 */
	@:native('NFD_ERROR')
	var NFD_ERROR;

	/**
	 * User pressed okay, or successful return
	 */
	@:native('NFD_OKAY')
	var NFD_OKAY;

	/**
	 * User pressed cancel
	 */
	@:native('NFD_CANCEL')
	var NFD_CANCEL;

	@:from
	static public inline function fromInt(i:Int):NFDResult_T
		return cast i;

	@:to extern public inline function toInt():Int
		return untyped this;
}

@:buildXml('<include name="${haxelib:hxnativefiledialog}/project/Build.xml" />')
@:include('nfd.h')
@:native('nfdresult_t')
private extern class NFDResult_T_Impl {}

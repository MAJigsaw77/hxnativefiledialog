package hxnativefiledialog;

#if !cpp
#error 'Native File Dialog supports only C++ target platforms.'
#end

class Types {} // blank

/* opaque data structure -- see NFD_PathSet_* */
@:buildXml('<include name="${haxelib:hxnativefiledialog}/project/Build.xml" />')
@:include('nfd.h')
@:unreflective
@:structAccess
@:native('nfdpathset_t')
extern class NFDPathSet_T
{
	@:native('nfdpathset_t')
	static function create():NFDPathSet_T;

	var buf:cpp.CharStar;
	var indices:cpp.RawPointer<cpp.SizeT>; /* byte offsets into buf */
	var count:cpp.SizeT; /* number of indices into buf */
}

extern enum abstract NFDResult_T(NFDResult_T_Impl)
{
	/* programmatic error */
	@:native('NFD_ERROR')
	var NFD_ERROR;

	/* user pressed okay, or successful return */
	@:native('NFD_OKAY')
	var NFD_OKAY;

	/* user pressed cancel */
	@:native('NFD_CANCEL')
	var NFD_CANCEL;

	@:to extern public inline function toInt():Int
		return untyped this;
}

@:buildXml('<include name="${haxelib:hxnativefiledialog}/project/Build.xml" />')
@:include('nfd.h')
@:native('nfdresult_t')
private extern class NFDResult_T_Impl {}

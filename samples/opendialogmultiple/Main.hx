package;

import hxnativefiledialog.NFD;
import hxnativefiledialog.Types;

class Main
{
	public static function main():Void
	{
		var pathSet:NFDPathSet_T = NFDPathSet_T.alloc();

		var result:NFDResult_T = NFD.OpenDialogMultiple("png,jpg;pdf", null, cpp.RawPointer.addressOf(pathSet));

		switch (result)
		{
			case NFD_OKAY:
				final count:cpp.SizeT = NFD.PathSet_GetCount(cpp.RawConstPointer.addressOf(pathSet));

				for (i in 0...count)
				{
					var path:NFDCharStar_T = NFD.PathSet_GetPath(cpp.RawConstPointer.addressOf(pathSet), i);

					if (path != null)
					{
						final pathString:String = cast(path, String);

						Sys.println('Path $i: $pathString');

						cpp.Stdlib.nativeFree(untyped path);
					}
					else
						Sys.println('Path at index $i is null.');
				}

				NFD.PathSet_Free(cpp.RawPointer.addressOf(pathSet));
			case NFD_CANCEL:
				Sys.println('User pressed cancel.');
			default:
				Sys.println('Error: ${NFD.GetError()}');
		}
	}
}

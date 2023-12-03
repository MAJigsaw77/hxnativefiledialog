package;

import hxnativefiledialog.NFD;
import hxnativefiledialog.Types;

class Main
{
	public static function main():Void
	{
		var pathSet:NFDPathSet_T = NFDPathSet_T.create();

		switch (NFD.OpenDialogMultiple("png,jpg;pdf", null, cpp.RawPointer.addressOf(pathSet)))
		{
			case NFD_OKAY:
				for (i in 0...NFD.PathSet_GetCount(cpp.RawPointer.addressOf(pathSet)))
				{
					final path:String = cast(NFD.PathSet_GetPath(cpp.RawPointer.addressOf(pathSet), i), String);

					Sys.println('Path! $i: $path');
				}
		
				NFD.PathSet_Free(cpp.RawPointer.addressOf(pathSet));
			case NFD_CANCEL:
				Sys.println('User pressed cancel.');
			default:
				Sys.println('Error: ${NFD.GetError()}');
		}
	}
}

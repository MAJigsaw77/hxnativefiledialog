package;

import hxnativefiledialog.NFD;
import hxnativefiledialog.Types;

class Main
{
	public static function main():Void
	{
		var outPath:NFDCharStar_T = null;

		var result:NFDResult_T = NFD.PickFolder(null, cpp.RawPointer.addressOf(outPath));

		switch (result)
		{
			case NFD_OKAY:
				if (outPath != null)
				{
					var outPathString:String = cast(outPath, String);

					Sys.println('Success! $outPathString');

					cpp.Stdlib.nativeFree(untyped outPath);
				}
				else
					Sys.println('Success, but outPath is null.');
			case NFD_CANCEL:
				Sys.println('User pressed cancel.');
			default:
				Sys.println('Error: ${NFD.GetError()}');
		}
	}
}

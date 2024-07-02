package;

import hxnativefiledialog.NFD;
import hxnativefiledialog.Types;

class Main
{
	public static function main():Void
	{
		var savePath:NFDCharStar_T = null;

		var result:NFDResult_T = NFD.SaveDialog("png,jpg;pdf", null, cpp.RawPointer.addressOf(savePath));

		switch (result)
		{
			case NFD_OKAY:
				if (savePath != null)
				{
					var savePathString:String = cast(savePath, String);

					Sys.println('Success! $savePathString');

					cpp.Stdlib.nativeFree(untyped savePath);
				}
				else
					Sys.println('Success, but savePath is null.');
			case NFD_CANCEL:
				Sys.println('User pressed cancel.');
			default:
				Sys.println('Error: ${NFD.GetError()}');
		}
	}
}

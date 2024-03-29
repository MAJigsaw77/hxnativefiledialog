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
				Sys.println('Success! $savePath');
			case NFD_CANCEL:
				Sys.println('User pressed cancel.');
			default:
				Sys.println('Error: ${NFD.GetError()}');
		}
	}
}

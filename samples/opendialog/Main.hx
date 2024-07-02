package;

import hxnativefiledialog.NFD;
import hxnativefiledialog.Types;

class Main
{
	public static function main():Void
	{
		var outPath:NFDCharStar_T = null;

		var result:NFDResult_T = NFD.OpenDialog("png,jpg;pdf", null, cpp.RawPointer.addressOf(outPath));

		switch (result)
		{
			case NFD_OKAY:
				if (outPath != null)
				{
					Sys.println('Success!');
					Sys.println(cast(outPath, String));
					NFD.Free(outPath);
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

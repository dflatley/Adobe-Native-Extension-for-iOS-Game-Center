package com.pxldesigns.bazinga
{
	import flash.external.ExtensionContext;
	
	public class BazingaANE implements iBazingaANE
	{
		protected static const EXTENSION_ID : String = "com.pxldesigns.bazinga.BazingaANE";
		
		protected var context:ExtensionContext;
		
		public function BazingaANE()
		{
			context = ExtensionContext.createExtensionContext( EXTENSION_ID, null );
		}
		
		public function loginUser():void
		{
			context.call("loginUser");
		}
		
		public function showAchievements():void
		{
			context.call("showAchievements");
		}
		
		public function showLeader():void
		{
			context.call("showLeader");
		}
	}
}
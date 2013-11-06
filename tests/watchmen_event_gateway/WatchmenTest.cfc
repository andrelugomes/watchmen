<cfcomponent output="true" extends="mxunit.framework.TestCase">
	<cffunction name="testWatchmenJobRunner" access="public" returnType="void">
		<cfscript>
			makepublic(Watchmen,"watchmenJobRunner");
			makepublic(Watchmen,"readConfigFile");
			injectmethod(Watchmen,this,"mockReadConfigFile","readConfigFile");
			var data = mockCFEventData();
			var running = Watchmen.watchmenJobRunner(data);	
			var mock = 	serializejson(mockResultRunnig());	
			assertEquals(mock,running,"RESULTS ARE DIFERENTS");
		</cfscript> 
	</cffunction>

	<cffunction name="testRunJobs" access="public" returnType="void"><cfscript>
			assertTrue(true);
		</cfscript>
	</cffunction>
		
	<!--- setup and teardown --->
	<cffunction name="setUp" returntype="void" access="public">
		<cfscript>
			Watchmen = createObject("component","watchmen.watchmen_event_gateway.Watchmen");
		</cfscript> 
	</cffunction>
	<cffunction name="tearDown" returntype="void" access="public">
		<!--- Any code needed to return your environment to normal goes here --->
	</cffunction>

	<!--- MOCKs --->
	<cffunction name="mockCFEventData" returntype="struct" access="private">
		<cfreturn deserializeJSON("{""LASTMODIFIED"":""Novembro, 04 2013 11:39:26"",""FILENAME"":""C:\\ColdFusion10\\cfusion\\wwwroot\\watchmen\\watchmen_event_gateway\\Watchmen.cfc"",""TYPE"":""CHANGE""}") />
	</cffunction>

	<cffunction name="mockResultRunnig" returntype="struct" access="private">
		<cfreturn deserializeJSON("{""APP"":""Watchmen"",""JOBS"":{""app"":{""name"":""Watchmen"",""rootcontext"":""watchmen""},""watch"":{""watchmen_event_gateway"":{""onChange"":{""jobs"":""resetRestApplication""},""onAdd"":{""jobs"":""resetRestApplication""},""onDelete"":{""jobs"":""resetRestApplication""}}}},""DIRINDEX"":5,""DIRLIST"":""model,service,watchmen_event_gateway,controller"",""ROOTCONTEXT"":""watchmen"",""DATA"":{""LASTMODIFIED"":""Novembro, 04 2013 13:24:17"",""FILENAME"":""C:\\ColdFusion10\\cfusion\\wwwroot\\watchmen\\watchmen_event_gateway\\Watchmen.cfc"",""TYPE"":""CHANGE""},""DIRCHANGED"":""watchmen_event_gateway""}") />
	</cffunction>

	<cffunction name="mockReadConfigFile" returntype="struct" access="private">
		<!--- <cffile action="read" file="#getDirectoryFromPath(getCurrentTemplatePath())#resources\watchmen-jobs.txt" charset="utf-8" variable="jobs"> --->
		<cfreturn deserializeJSON("{""app"":{""name"":""Watchmen"",""rootcontext"":""watchmen""},""watch"":{""watchmen_event_gateway"":{""onChange"":{""jobs"":""resetRestApplication""},""onAdd"":{""jobs"":""resetRestApplication""},""onDelete"":{""jobs"":""resetRestApplication""}}}}") />
	</cffunction>
</cfcomponent>

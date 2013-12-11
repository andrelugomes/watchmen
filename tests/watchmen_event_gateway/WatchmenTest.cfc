<cfcomponent output="true" extends="mxunit.framework.TestCase">
	<cffunction name="testWatchmenJobRunner" access="public" returnType="void">
		<cfscript>
			makepublic(Watchmen,"watchmenJobRunner");
			makepublic(Watchmen,"readConfigFile");
			injectmethod(Watchmen,this,"mockReadConfigFile","readConfigFile");
			var data = mockCFEventData();
			var running = deserializejson(Watchmen.watchmenJobRunner(data));	
			var mock = 	mockResultRunnig();	
			assertEquals(mock.app,running.app,"RESULTS ARE DIFERENTS");
		</cfscript> 
	</cffunction>
	
	<cffunction name="testJobsAreStructs" access="public" returnType="void">
		<cfscript>
			makepublic(Watchmen,"watchmenJobRunner");
			makepublic(Watchmen,"readConfigFile");
			injectmethod(Watchmen,this,"mockReadConfigFile","readConfigFile");
			var data = mockCFEventData();
			var running = Watchmen.watchmenJobRunner(data);	
			var mock = 	mockResultRunnig();	
			assertEquals(mock.jobs,deserializejson(running).jobs,"NOT STRUCTUS");
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
		<cfreturn deserializeJSON("{""app"":""Watchmen"",""jobs"":{""app"":{""name"":""watchmen"",""rootcontext"":""watchmen""},""watch"":{""watchmen_event_gateway"":{""CHANGE"":{""jobs"":""resetrestapplication""},""ADD"":{""jobs"":""resetrestapplication""},""DELETE"":{""jobs"":""resetrestapplication""}}}},""dirindex"":5,""dirlist"":""watchmen_event_gateway"",""rootcontext"":""watchmen"",""data"":{""lastmodified"":""novembro, 04 2013 11:39:26"",""filename"":""c:\\coldfusion10\\cfusion\\wwwroot\\watchmen\\watchmen_event_gateway\\watchmen.cfc"",""type"":""change""},""dirchanged"":""watchmen_event_gateway""}") />
	</cffunction>

	<cffunction name="mockReadConfigFile" returntype="struct" access="private">
		<!--- <cffile action="read" file="#getDirectoryFromPath(getCurrentTemplatePath())#resources\watchmen-jobs.txt" charset="utf-8" variable="jobs"> --->
		<cfreturn deserializeJSON("{""app"":{""name"":""Watchmen"",""rootcontext"":""watchmen""},""watch"":{""watchmen_event_gateway"":{""CHANGE"":{""jobs"":""resetRestApplication,resetApplication,resetORM""},""ADD"":{""jobs"":""resetRestApplication""},""DELETE"":{""jobs"":""resetRestApplication""}}}}") />
	</cffunction>
</cfcomponent>

<cfcomponent name="Watchmen" output="false" extends="Jobs">
	<cffunction name="onAdd" output="false">
		<cfargument name="CFEvent" type="struct" required="yes" />
		<cfset watchmenJobRunner(CFEvent.data)>
	</cffunction>
	
	<cffunction name="onDelete" output="false">
		<cfargument name="CFEvent" type="struct" required="yes" />
		<cfset watchmenJobRunner(CFEvent.data)>
	</cffunction>
	
	<cffunction name="onChange" output="false">
		<cfargument name="CFEvent" type="struct" required="yes" />
		<cfset watchmenJobRunner(CFEvent.data)>
	</cffunction>
	
	<cffunction name="watchmenJobRunner" output="false" access="private" returntype="any">
		<cfargument name="data" type="struct" required="yes" />
		<cftry>
			<cfreturn runJobs(data)>
			<cfcatch>
				<cflog file="Watchmen-Error" application="No" text="ERROR:#cfcatch.message#; #cfcatch.detail#">
				<cfreturn serializeJSON(cfcatch)>
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="runJobs" output="false" access="private" returntype="any">
		<cfargument name="data" type="struct" required="yes" />
		<cftry>
			<cfset running = structNew()>
			<cfset running.jobs = readConfigFile()>
			<cfset running.app = running.jobs.app.name>
			<cfset running.rootContext = running.jobs.app.rootContext>
			<cfset running.dirindex = listFindNoCase(arguments.data.filename,running.rootcontext,'\')>
			<cfset running.dirchanged = listGetAt(arguments.data.filename,running.dirindex+1,'\')>
			<cfset running.dirList = StructKeyList(running.jobs.watch)>
			<cfset running.data = arguments.data>
			
			<cfif listFind(running.dirList,running.dirchanged)>
				<cflog file="Watchmen-#running.app#" application="No" text="DATA :#serializeJSON(running)#">
				<cfreturn serializeJSON(running)>
			<cfelse>
				<cflog file="Watchmen-#running.app#" application="No" text=" NO WATCHING : #running.dirchanged#">
				<cfreturn serializeJSON(running)>
			</cfif>
			<cfcatch>
				<cflog file="Watchmen-Error" application="No" text=" ERROR: #cfcatch.message#;#cfcatch.detail#">
				<cfreturn serializeJSON(cfcatch)>
			</cfcatch>
		</cftry>				
	</cffunction>	
	<cffunction name="readConfigFile" output="false" access="private" returntype="any">
		<cftry>
			<cffile action="read" file="#getDirectoryFromPath(getCurrentTemplatePath())#watchmen-jobs.txt" charset="utf-8" variable="jobs">
			<cfreturn deserializeJSON(jobs)>
			<cfcatch>
				<cfthrow errorcode="500" type="Application" detail="Erro ao ler o arquivo de configuração de JOBs: watchmen-jobs.txt" message="Erro ao ler o arquivo de configuração de JOBs: watchmen-jobs.txt">
			</cfcatch>
		</cftry>				
	</cffunction>	
</cfcomponent>

<cfcomponent name="Watchmen" output="false" extends="Jobs">
	<cffunction name="onAdd" output="no">
		<cfargument name="CFEvent" type="struct" required="yes" />
		<cfset watchmenJobRunner(CFEvent.data)>
	</cffunction>
	
	<cffunction name="onDelete" output="no">
		<cfargument name="CFEvent" type="struct" required="yes" />
		<cfset watchmenJobRunner(CFEvent.data)>
	</cffunction>
	
	<cffunction name="onChange" output="no">
		<cfargument name="CFEvent" type="struct" required="yes" />
		<cfset watchmenJobRunner(CFEvent.data)>
	</cffunction>
	
	<cffunction name="watchmenJobRunner" output="false" access="private">
		<cfargument name="data" type="struct" required="yes" />
		<cftry>
			<cfset runJobs(data)>
			<cfcatch>
				<cflog file="Watchmen" application="No" text="ERROR:#cfcatch.message#; #cfcatch.detail#">
			</cfcatch>
		</cftry>
	</cffunction>
	<cffunction name="runJobs" output="false" access="private">
		<cfargument name="data" type="struct" required="yes" />
		<cftry>
			<cffile action="read" file="#getDirectoryFromPath(getCurrentTemplatePath())#watchmen-jobs.txt" charset="utf-8" variable="jobs">
			<cfset jobs = deserializeJSON(jobs)>
			<cfset app = jobs.app.name>
			<cfset rootContext = jobs.app.rootContext>
			<cfset dirindex = listFindNoCase(data.filename,rootcontext,'\')>
			<cfset dirchanged = listGetAt(data.filename,dirindex+1,'\')>
			<cfset dirList = StructKeyList(jobs.watch)>
			
			<cfif listFind(dirList,dirchanged)>
				
				
				
			<cfelse>
				<cflog file="Watchmen-#app#" application="No" text=" NO WATCHING : #dirchanged#">
			</cfif>
			<cfcatch>
				<cflog file="Watchmen-#app#" application="No" text=" ERROR: #cfcatch.message#|#cfcatch.detail#">
			</cfcatch>
		</cftry>				
	</cffunction>
</cfcomponent>

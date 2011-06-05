<!---||MELDFORUMSLICENSE||--->
<cfcomponent name="UserService" output="false" extends="MeldForums.com.meldsolutions.core.MeldService">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="UserService">
		<cfreturn this/>
	</cffunction>

	<cffunction name="createUser" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="UserID" type="uuid" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="Screenname" type="string" required="false" />
		<cfargument name="AvatarID" type="string" required="false" />
		<cfargument name="RedoAvatar" type="boolean" required="false" />
		<cfargument name="ThreadCounter" type="numeric" required="false" />
		<cfargument name="LastPostID" type="string" required="false" />
		<cfargument name="LastThreadID" type="string" required="false" />
		<cfargument name="AdminMessage" type="string" required="false" />
		<cfargument name="IsConfirmed" type="boolean" required="false" />
		<cfargument name="IsPrivate" type="boolean" required="false" />
		<cfargument name="IsPostBlocked" type="boolean" required="false" />
		<cfargument name="IsBlocked" type="boolean" required="false" />
		<cfargument name="DoReplyNotifications" type="boolean" required="false" />
		<cfargument name="PostCounter" type="numeric" required="false" />
		<cfargument name="DateLastAction" type="string" required="false" />
		<cfargument name="DateLastLogin" type="string" required="false" />
		<cfargument name="DateIsNewFrom" type="string" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
				
		<cfset var tmpObj = createObject("component","UserBean").init(argumentCollection=arguments) />
		<cfset tmpObj.setUserService( this ) />
		<cfreturn tmpObj />
	</cffunction>

	<cffunction name="getUser" access="public" output="false" returntype="any">
		<!---^^PRIMARY-START^^--->
		<cfargument name="UserID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var UserBean = createUser(argumentCollection=arguments) />
		<cfset getUserDAO().read(UserBean) />
		<cfreturn UserBean />
	</cffunction>

	<cffunction name="getUsers" access="public" output="false" returntype="array">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="UserID" type="uuid" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="Screenname" type="string" required="false" />
		<cfargument name="AvatarID" type="string" required="false" />
		<cfargument name="RedoAvatar" type="boolean" required="false" />
		<cfargument name="ThreadCounter" type="numeric" required="false" />
		<cfargument name="LastPostID" type="string" required="false" />
		<cfargument name="LastThreadID" type="string" required="false" />
		<cfargument name="AdminMessage" type="string" required="false" />
		<cfargument name="IsConfirmed" type="boolean" required="false" />
		<cfargument name="IsPrivate" type="boolean" required="false" />
		<cfargument name="IsPostBlocked" type="boolean" required="false" />
		<cfargument name="IsBlocked" type="boolean" required="false" />
		<cfargument name="DoReplyNotifications" type="boolean" required="false" />
		<cfargument name="PostCounter" type="numeric" required="false" />
		<cfargument name="DateLastAction" type="string" required="false" />
		<cfargument name="DateLastLogin" type="string" required="false" />
		<cfargument name="DateIsNewFrom" type="string" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfreturn getUserGateway().getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="UserID" type="uuid" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="Screenname" type="string" required="false" />
		<cfargument name="AvatarID" type="string" required="false" />
		<cfargument name="RedoAvatar" type="boolean" required="false" />
		<cfargument name="ThreadCounter" type="numeric" required="false" />
		<cfargument name="LastPostID" type="string" required="false" />
		<cfargument name="LastThreadID" type="string" required="false" />
		<cfargument name="AdminMessage" type="string" required="false" />
		<cfargument name="IsConfirmed" type="boolean" required="false" />
		<cfargument name="IsPrivate" type="boolean" required="false" />
		<cfargument name="IsPostBlocked" type="boolean" required="false" />
		<cfargument name="IsBlocked" type="boolean" required="false" />
		<cfargument name="DoReplyNotifications" type="boolean" required="false" />
		<cfargument name="PostCounter" type="numeric" required="false" />
		<cfargument name="DateLastAction" type="string" required="false" />
		<cfargument name="DateLastLogin" type="string" required="false" />
		<cfargument name="DateIsNewFrom" type="string" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->

		<cfreturn getUserGateway().getBeanByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getByArray" access="public" output="false" returntype="Query" >
		<cfargument name="idArray" type="array" required="true" />

		<cfreturn getUserGateway().getByArray(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="search" access="public" output="false" returntype="struct">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="false" default="*" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="10"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isPaged" type="numeric" required="false" default="true" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var arrObjects		= ArrayNew(1)>
		<cfset var iiX				= "" >
		<cfset var isValid			= false >
		<cfset var sReturn			= StructNew()>
		
		<cfif arguments.isPaged and not arguments.count>
			<cfset arguments.isCount = true>
			<cfset sReturn.count = getUserGateway().search(argumentCollection=arguments) />
			<cfset arguments.isCount = false>
		<cfelse>
			<cfset sReturn.count = arguments.count />
		</cfif>
		
		<cfset arrObjects = getUserGateway().search(argumentCollection=arguments) />

		<cfset sReturn.start		= arguments.start />
		<cfset sReturn.size			= arguments.size />
		<cfset sReturn.itemarray	= arrObjects />

		<cfreturn sReturn />
	</cffunction>

	<cffunction name="saveUser" access="public" output="false" returntype="boolean">
		<cfargument name="UserBean" type="any" required="true" />

		<cfreturn getUserDAO().save(UserBean) />
	</cffunction>
	
	<cffunction name="updateUser" access="public" output="false" returntype="boolean">
		<cfargument name="UserBean" type="any" required="true" />

		<cfreturn getUserDAO().update(UserBean) />
	</cffunction>

	<cffunction name="deleteUser" access="public" output="false" returntype="boolean">
		<!---^^PRIMARY-START^^--->
		<cfargument name="UserID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var UserBean = createUser(argumentCollection=arguments) />
		<cfreturn getUserDAO().delete(UserBean) />
	</cffunction>

	<cffunction name="setUserGateway" access="public" returntype="void" output="false">
		<cfargument name="UserGateway" type="any" required="true" />
		<cfset variables['userGateway'] = arguments.UserGateway />
	</cffunction>
	<cffunction name="getUserGateway" access="public" returntype="any" output="false">
		<cfreturn UserGateway />
	</cffunction>

	<cffunction name="setUserDAO" access="public" returntype="void" output="false">
		<cfargument name="UserDAO" type="any" required="true" />
		<cfset variables['userDAO'] = arguments.UserDAO />
	</cffunction>
	<cffunction name="getUserDAO" access="public" returntype="any" output="false">
		<cfreturn variables.UserDAO />
	</cffunction>

<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->
	<cffunction name="getFullUser" access="public" output="false" returntype="any">
		<cfargument name="userID" type="string" required="true" />
		<cfset var userBean				= getuser( argumentCollection=arguments ) />
		<cfset var muraUserManager		= getMuraManager().getBean("userManager") />
		<cfset var externalBean			= "" />
		<cfset var postBean				= "" />
		<cfset var threadBean			= "" />
		<cfset var userFound			= false>
		<cfset var currentThemeID		= "">
		<cfset var settingsBean			= "">
		<cfset var avatarID				= "">

		<cfif not userBean.beanExists()>
			<cfset userFound = importUser( arguments.userID )>

			<cfif not userFound>
				<cfreturn userBean>
			<cfelse>
				<cfset userBean	= getuser( argumentCollection=arguments ) />
			</cfif>
		</cfif>		

		<cfif userBean.beanExists()>
		
			<cfset externalBean = muraUserManager.read( userBean.getUserID() ) />
			<cfset userBean.setExternalUserBean( externalBean ) />

			<cfset settingsBean = getMeldForumsSettingsManager().getSiteSettings( userBean.getSiteID() )>
			<cfset currentThemeID = settingsBean.getThemeID()>

			<cfif len(userBean.getAvatarID()) and currentThemeID neq userBean.getThemeID()>
				<cfset avatarID = recreateAvatar( userBean,settingsBean )>
				<cfif len(avatarID)>
					<cfset userBean.setAvatarID( avatarID )>
					<cfset userBean.setThemeID( currentThemeID )>
					<cfset updateuser( userBean )>
				<cfelse>
					<cfset userBean.setAvatarID( "" )>
					<cfset updateProfile( userBean )>
				</cfif>
			</cfif>

			<cfif len( userBean.getLastPostID() )>
				<cfset postBean = getPostService().getPost( userBean.getLastPostID() ) />
				<cfif isDate(postBean.getDateCreate())>
					<cfset userBean.setPost( postBean ) />
				</cfif>
			</cfif>
			<cfif len( userBean.getLastthreadID() )>
				<cfset threadBean = getThreadService().getthread( userBean.getLastthreadID() ) />
				<cfif isDate(threadBean.getDateCreate())>
					<cfset userBean.setThread( threadBean ) />
				</cfif>
			</cfif>
		</cfif>

		<cfreturn userBean />
	</cffunction>
	
	<cffunction name="importUser" access="public" output="false" returntype="boolean">
		<cfargument name="userID" type="string" required="true" />
		
		<cfset var externalUserBean  = getMuraManager().getBean("userManager").read( arguments.userID )>
		<cfset var userBean  = createuser( arguments.userID )>
		
		<cfif externalUserBean.getUserID() neq arguments.userID>
			<cfreturn false>
		</cfif>
		
		<cfset userBean.setSiteID( externalUserBean.getSiteID() )>
		<cfset userBean.setScreenName( externalUserBean.getUserName() )>
		<cfif isDate( externalUserBean.getPasswordCreated() )>
			<cfset userBean.setDateCreate( externalUserBean.getPasswordCreated() )>
		<cfelse>
			<cfset userBean.setDateCreate( createODBCDateTime(now() ) )>
		</cfif>

		<cfset userBean.setdateLastLogin( createODBCDateTime(now() ) )>
		<cfset userBean.setdateIsNewFrom( createODBCDateTime(now() ) )>
		<cfset userBean.setdateLastAction( createODBCDateTime(now() ) )>
		
		<cfset getUserDAO().save( userBean ) />
		<cfreturn true />
	</cffunction>

	<cffunction name="userAddedThread" access="public" output="false" returntype="void">
		<cfargument name="userID" type="string" required="true" />
		<cfargument name="threadID" type="string" required="true" />
		<cfargument name="siteID" type="string" required="true" />

		<cfset getUserGateway().userAddedThread( arguments.userID,arguments.threadID ) />
		<cfset getUserCache( arguments.siteID ).markDirty( arguments.userID ) />
	</cffunction>

	<cffunction name="userAddedPost" access="public" output="false" returntype="void">
		<cfargument name="userID" type="string" required="true" />
		<cfargument name="postID" type="string" required="true" />
		<cfargument name="siteID" type="string" required="true" />

		<cfset getUserGateway().userAddedPost( arguments.userID,arguments.postID ) />
		<cfset getUserCache( arguments.siteID ).markDirty( arguments.userID ) />
	</cffunction>

	<cffunction name="getUserCache" access="public" returntype="any" output="false">
		<cfargument name="siteID" type="string" required="true" />
		<cfreturn getMeldForumsSettingsManager().getSiteSettings(arguments.siteID).getUserCache()>
	</cffunction>

<!---^^CUSTOMEND^^--->
	<cffunction name="setMeldForumsSettingsManager" access="public" returntype="any" output="false">
		<cfargument name="MeldForumsSettingsManager" type="any" required="true">
		<cfset variables.instance.MeldForumsSettingsManager = arguments.MeldForumsSettingsManager>
	</cffunction>
	<cffunction name="getMeldForumsSettingsManager" access="public" returntype="any" output="false">
		<cfreturn variables.instance.MeldForumsSettingsManager>
	</cffunction>

	<cffunction name="getMuraManager" access="public" output="false" returntype="any">
		<cfreturn variables.MuraManager />
	</cffunction>
	<cffunction name="setMuraManager" access="public" output="false" returntype="void">
		<cfargument name="MuraManager" type="any" required="true" />
		<cfset variables.MuraManager = arguments.MuraManager />
	</cffunction>

	<cffunction name="getPostService" access="public" output="false" returntype="any">
		<cfreturn variables.PostService />
	</cffunction>
	<cffunction name="setPostService" access="public" output="false" returntype="void">
		<cfargument name="PostService" type="any" required="true" />
		<cfset variables.PostService = arguments.PostService />
	</cffunction>

	<cffunction name="getThreadService" access="public" output="false" returntype="any">
		<cfreturn variables.ThreadService />
	</cffunction>
	<cffunction name="setThreadService" access="public" output="false" returntype="void">
		<cfargument name="ThreadService" type="any" required="true" />
		<cfset variables.ThreadService = arguments.ThreadService />
	</cffunction>

</cfcomponent>










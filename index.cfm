<html></html>
<img src="https://picsum.photos/200/300">
<cftry>
    <!--- Set the URL of the image --->
    <cfset imageUrl = "https://picsum.photos/200/300">

    <!--- Set the local path for saving the image --->
    <cfset localPath = expandPath("./output.png")>

    <!--- Fetch the image from the URL using cfhttp --->
    <cfhttp url="#imageUrl#" method="get" result="imageResponse">
        <!--- Specify any additional headers if needed --->
        <!--- <cfhttpparam type="header" name="HeaderName" value="HeaderValue"> --->
    </cfhttp>

    <!--- Check if the request was successful --->
    <cfif imageResponse.statusCode eq 200>
        <!--- Ensure there is actual file content --->
        <cfif isBinary(imageResponse.fileContent)>
            <!--- Save the image to a local file using cffile --->
            <cffile action="write" file="#localPath#" output="#imageResponse.fileContent#">

            <!--- Display a success message --->
            <cfoutput>Image saved successfully to: #localPath#</cfoutput>
        <cfelse>
            <cfoutput>No image content received.</cfoutput>
        </cfif>
    <cfelse>
        <!--- Display an error message if the request fails --->
        <cfoutput>Error fetching the image. HTTP status code: #imageResponse.statusCode#
        </cfoutput>
    </cfif>

    <!--- You might want to add additional error handling or logging here --->
    <cfcatch>
        <cfoutput>An unexpected error occurred: #cfcatch.message#</cfoutput>
        
        <cfdump var="#imageResponse#">

    </cfcatch>
</cftry>

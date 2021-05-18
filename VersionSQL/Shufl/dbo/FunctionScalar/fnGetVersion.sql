/****** Object:  Function [dbo].[fnGetVersion]    Committed by VersionSQL https://www.versionsql.com ******/

-- =============================================
-- Author:		Adam Barry-O'Donovan
-- Create date: 17/04/2021
-- Description:	Function to return version number
-- =============================================
CREATE FUNCTION [dbo].[fnGetVersion] ()
RETURNS varchar
AS
BEGIN

	RETURN '1.3.0'

END
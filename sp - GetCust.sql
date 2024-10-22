USE [TechnicalTest]
GO

/****** Object:  StoredProcedure [dbo].[GetCust]    Script Date: 22/10/2024 22:00:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetCust]
AS
BEGIN
	select distinct COM_CUSTOMER_ID as CUSTOMER_ID, CUSTOMER_NAME
	from COM_CUSTOMER with(nolock)
END
GO


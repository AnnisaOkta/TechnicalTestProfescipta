USE [TechnicalTest]
GO

/****** Object:  StoredProcedure [dbo].[GetDataGrid]    Script Date: 22/10/2024 22:00:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[GetDataGrid]
@WhereCond varchar(max)

AS
BEGIN
	exec('
		SELECT 
			a.SO_ORDER_ID,
			a.ORDER_NO,
			convert(varchar, a.ORDER_DATE, 103) ORDER_DATE,
			a.ADDRESS,
			b.COM_CUSTOMER_ID CUSTOMER_ID,
			b.CUSTOMER_NAME
		FROM SO_ORDER a with(nolock)
		LEFT JOIN COM_CUSTOMER b with(nolock) on a.COM_CUSTOMER_ID = b.COM_CUSTOMER_ID
	' + @WhereCond)
END
GO


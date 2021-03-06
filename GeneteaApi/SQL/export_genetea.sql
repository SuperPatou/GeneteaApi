USE [Genetea]
GO
/****** Object:  Table [dbo].[Teas]    Script Date: 13/06/2022 09:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teas](
	[IdTea] [int] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](100) NULL,
	[Description] [varchar](255) NULL,
	[Price] [float] NULL,
 CONSTRAINT [the_PK] PRIMARY KEY CLUSTERED 
(
	[IdTea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTea]    Script Date: 13/06/2022 09:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteTea] 
	@IdTea int
AS   

    SET NOCOUNT ON;  
    DELETE
	FROM Teas
	WHERE IdTea = @IdTea
GO
/****** Object:  StoredProcedure [dbo].[GetTea]    Script Date: 13/06/2022 09:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetTea] 
	@IdTea int
AS   

    SET NOCOUNT ON;  
    SELECT IdTea, Label, Description, Price  
    FROM Teas
	WHERE IdTea = @IdTea
GO
/****** Object:  StoredProcedure [dbo].[GetTeas]    Script Date: 13/06/2022 09:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTeas]   
AS   

    SET NOCOUNT ON;  
    SELECT IdTea, Label, Description, Price  
    FROM Teas
GO
/****** Object:  StoredProcedure [dbo].[InsertTea]    Script Date: 13/06/2022 09:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertTea]
	@Description varchar(250),
	@Price float,
	@Label varchar(250)
AS   

    SET NOCOUNT ON; 
	INSERT INTO Teas
           (Label
           ,Description
           ,Price)
     VALUES
           (@Label
           ,@Description
           ,@Price)
GO
/****** Object:  StoredProcedure [dbo].[UpdateTea]    Script Date: 13/06/2022 09:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateTea] 
	@IdTea int,
	@Description varchar(250),
	@Price float,
	@Label varchar(250)
AS   

    SET NOCOUNT ON; 
	UPDATE Teas
	Set Description = @Description, Price = @Price, Label = @Label
    WHERE IdTea = @IdTea
GO

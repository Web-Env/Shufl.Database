/****** Object:  Table [dbo].[ArtistImage]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ArtistImage](
	[Id] [uniqueidentifier] NOT NULL,
	[ArtistId] [uniqueidentifier] NOT NULL,
	[Width] [smallint] NOT NULL,
	[Height] [smallint] NOT NULL,
	[Uri] [char](40) NOT NULL,
 CONSTRAINT [PK_ArtistImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_ArtistImage_ArtistId] ON [dbo].[ArtistImage]
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[ArtistImage] ADD  CONSTRAINT [DF_ArtistImage_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[ArtistImage]  WITH CHECK ADD  CONSTRAINT [FK_ArtistImage_Artist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([Id])
ALTER TABLE [dbo].[ArtistImage] CHECK CONSTRAINT [FK_ArtistImage_Artist]
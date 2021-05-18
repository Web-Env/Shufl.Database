/****** Object:  Table [dbo].[GroupPlaylist]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GroupPlaylist](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[Identifier] [char](24) NOT NULL,
	[PlaylistId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GroupPlaylist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

CREATE UNIQUE NONCLUSTERED INDEX [IX_GroupPlaylist_GroupId_Identifier] ON [dbo].[GroupPlaylist]
(
	[GroupId] ASC,
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [IX_GroupPlaylist_GroupId_PlaylistId] ON [dbo].[GroupPlaylist]
(
	[GroupId] ASC,
	[PlaylistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[GroupPlaylist] ADD  CONSTRAINT [DF_GroupPlaylist_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[GroupPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_GroupPlaylist_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
ALTER TABLE [dbo].[GroupPlaylist] CHECK CONSTRAINT [FK_GroupPlaylist_Group]
ALTER TABLE [dbo].[GroupPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_GroupPlaylist_Playlist] FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlist] ([Id])
ALTER TABLE [dbo].[GroupPlaylist] CHECK CONSTRAINT [FK_GroupPlaylist_Playlist]
ALTER TABLE [dbo].[GroupPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_GroupPlaylist_User_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[GroupPlaylist] CHECK CONSTRAINT [FK_GroupPlaylist_User_CreatedBy]
ALTER TABLE [dbo].[GroupPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_GroupPlaylist_User_LastUpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[GroupPlaylist] CHECK CONSTRAINT [FK_GroupPlaylist_User_LastUpdatedBy]
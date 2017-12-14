using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Collections;


namespace MediaInventory
{
    [DataObject(true)]
    public class ItemDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Item> GetItems()
        {
            List<Item> itemList = new List<Item>();
            string sql = "SELECT itemID, media_type, title, artist, ISBN_UPC "
                + "FROM media";
            using (MySqlConnection con = new MySqlConnection(GetConnectionString()))
            {
                using (MySqlCommand cmd = new MySqlCommand(sql, con))
                {
                    con.Open();
                    MySqlDataReader dr = cmd.ExecuteReader();
                    Item item;

                    if (itemList != null)
                    {
                        while (dr.Read())
                        {
                            item = new Item();
                            item.itemID = dr["itemID"].ToString();
                            item.MediaType = dr["media_type"].ToString();
                            item.Title = dr["title"].ToString();
                            item.ArtistAuthor = dr["artist"].ToString();
                            item.ISBN = dr["ISBN_UPC"].ToString();
                            itemList.Add(item);
                        }
                        dr.Close();
                        return itemList;
                    }
                    else
                    {
                        item = new Item();
                        item.itemID = "";
                        item.MediaType = "";
                        item.Title = "";
                        item.ArtistAuthor = "";
                        item.ISBN = "";
                        itemList.Add(item);
                        return itemList;
                    }
                }
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["inventoryConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
         public static void InsertItem (Item item)
          {
              string sql = "INSERT INTO media "
                  + "(itemID, media_type, title, artist, ISBN_UPC)"
                  + "VALUES (@itemID, @MediaType, @Title, @ArtistAuthor, @ISBN) ";
              using (MySqlConnection con = new MySqlConnection(GetConnectionString()))
              {
                  using (MySqlCommand cmd = new MySqlCommand(sql, con))
                  {
                    cmd.Parameters.AddWithValue("itemID", item.itemID);
                    cmd.Parameters.AddWithValue("media_type", item.MediaType);
                    cmd.Parameters.AddWithValue("title", item.Title);
                    cmd.Parameters.AddWithValue("artist", item.ArtistAuthor);
                    cmd.Parameters.AddWithValue("ISBN_UPC", item.ISBN);
                    con.Open();
                    cmd.ExecuteNonQuery();
                  }
              }
          }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public static int DeleteItem(Item item)
        {
            int deleteCount = 0;
            string sql = "DELETE FROM media "
                + "WHERE itemID = @itemID "
                + "AND title = @title "
                + "AND media_type = @MediaType "
                + "AND artist = @ArtistAUthor "
                + "AND ISBN_UPC = @ISBN ";
            using (MySqlConnection con = new MySqlConnection(GetConnectionString()))
            {
                using (MySqlCommand cmd = new MySqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("itemID", item.itemID);
                    cmd.Parameters.AddWithValue("media_type", item.MediaType);
                    cmd.Parameters.AddWithValue("title", item.Title);
                    cmd.Parameters.AddWithValue("artist", item.ArtistAuthor);
                    cmd.Parameters.AddWithValue("ISBN_UPC", item.ISBN);
                    con.Open();
                    deleteCount = cmd.ExecuteNonQuery();
                }
            }
            return deleteCount;
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public static int UpdateItem(Item original_item, Item item)
        {
            int updateCount = 0;
            string sql = "UPDATE media "
                + "SET title = @title, "
                + "media_type = @MediaType, "
                + "artist = @ArtistAuthor, "
                + "ISBN_UPC = @ISBN "
                + "WHERE itemID = @original_itemID "
                + "AND title = @original_title "
                + "AND media_type = @original_MediaType "
                + "AND artist = @original_artistAuthor "
                + "AND ISBN_UPC = @original_ISBN ";
            using (MySqlConnection con = new MySqlConnection(GetConnectionString()))
            {
                using (MySqlCommand cmd = new MySqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("itemID", item.itemID);
                    cmd.Parameters.AddWithValue("media_type", item.MediaType);
                    cmd.Parameters.AddWithValue("title", item.Title);
                    cmd.Parameters.AddWithValue("artist", item.ArtistAuthor);
                    cmd.Parameters.AddWithValue("ISBN_UPC", item.ISBN);

                    cmd.Parameters.AddWithValue("original_itemID", original_item.itemID);
                    cmd.Parameters.AddWithValue("original_media_type", original_item.MediaType);
                    cmd.Parameters.AddWithValue("original_title", original_item.Title);
                    cmd.Parameters.AddWithValue("original_artist", original_item.ArtistAuthor);
                    cmd.Parameters.AddWithValue("original_ISBN_UPC", original_item.ISBN);
                    con.Open();
                    updateCount = cmd.ExecuteNonQuery();
                }
            }
            return updateCount;
        }

    }
}
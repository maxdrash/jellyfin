﻿using MediaBrowser.Model.Dto;
using System;

namespace MediaBrowser.Model.Querying
{
    public class QueryFiltersLegacy
    {
        public string[] Genres { get; set; }
        public string[] Tags { get; set; }
        public string[] OfficialRatings { get; set; }
        public int[] Years { get; set; }

        public QueryFiltersLegacy()
        {
            Genres = Array.Empty<string>();
            Tags = Array.Empty<string>();
            OfficialRatings = Array.Empty<string>();
            Years = Array.Empty<int>();
        }
    }
    public class QueryFilters
    {
        public NameGuidPair[] Genres { get; set; }
        public string[] Tags { get; set; }

        public QueryFilters()
        {
            Tags = Array.Empty<string>();
            Genres = new NameGuidPair[] { };
        }
    }
}

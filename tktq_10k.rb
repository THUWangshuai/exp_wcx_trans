# stddmgr!
event_data "tktq_10k" do
  # define a custom converter
  convert(<<-CPP
  uint64_t parse_timestamp(const char *tokens) {
    return atoi(tokens) * 1000000ULL + atoi(tokens + 9) * 1000 + atoi(tokens + 16) / 1000;
  }
  CPP
  )

  delim "|"
  columns 16

  # estimated number of events per day, required for event_data
  per_year  1000000

  datapath "/nfs/syno11/researchers/KGT/ktoraman/tktq_signals_v8/10-K/${YYYY}/${MM}/tktq_signals.${YYYYMMDD}"

  struct do
    bbid 1, "ii"
    float 3, "char_cnt"
    float 4, "word_cnt"
    float 5, "fog"
    float 6, "item1a_sim"
    float 7, "item3_sim"
    float 8, "item7_sim"
    float 9, "item7a_sim"
    float 10, "item9b_sim"
    float 11, "item1a_wcnt"
    float 12, "item3_wcnt"
    float 13, "item7_wcnt"
    float 14, "item7a_wcnt"
    float 15, "item9b_wcnt"
  end
end

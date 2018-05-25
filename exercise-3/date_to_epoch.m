function result = date_to_epoch(date_string)
    result = posixtime(datetime(date_string));
end
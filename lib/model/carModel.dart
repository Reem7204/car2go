
class MapModel {
    bool? success;
    int? code;
    String? message;
    Data? data;

    MapModel({this.success, this.code, this.message, this.data});

    MapModel.fromJson(Map<String, dynamic> json) {
        if(json["success"] is bool) {
            success = json["success"];
        }
        if(json["code"] is num) {
            code = (json["code"] as num).toInt();
        }
        if(json["message"] is String) {
            message = json["message"];
        }
        if(json["data"] is Map) {
            data = json["data"] == null ? null : Data.fromJson(json["data"]);
        }
    }

    static List<MapModel> fromList(List<Map<String, dynamic>> list) {
        return list.map(MapModel.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["success"] = success;
        _data["code"] = code;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }

    MapModel copyWith({
        bool? success,
        int? code,
        String? message,
        Data? data,
    }) => MapModel(
        success: success ?? this.success,
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
    );
}

class Data {
    List<SearchResults>? searchResults;
    dynamic discountBanner;
    Content1? content;
    List<Filter>? filter;
    List<Sort>? sort;
    String? searchKey;
    SearchContext? searchContext;
    int? count;
    bool? isGeniusLocation;

    Data({this.searchResults, this.discountBanner, this.content, this.filter, this.sort, this.searchKey, this.searchContext, this.count, this.isGeniusLocation});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["search_results"] is List) {
            searchResults = json["search_results"] == null ? null : (json["search_results"] as List).map((e) => SearchResults.fromJson(e)).toList();
        }
        discountBanner = json["discount_banner"];
        if(json["content"] is Map) {
            content = json["content"] == null ? null : Content1.fromJson(json["content"]);
        }
        if(json["filter"] is List) {
            filter = json["filter"] == null ? null : (json["filter"] as List).map((e) => Filter.fromJson(e)).toList();
        }
        if(json["sort"] is List) {
            sort = json["sort"] == null ? null : (json["sort"] as List).map((e) => Sort.fromJson(e)).toList();
        }
        if(json["search_key"] is String) {
            searchKey = json["search_key"];
        }
        if(json["search_context"] is Map) {
            searchContext = json["search_context"] == null ? null : SearchContext.fromJson(json["search_context"]);
        }
        if(json["count"] is num) {
            count = (json["count"] as num).toInt();
        }
        if(json["is_genius_location"] is bool) {
            isGeniusLocation = json["is_genius_location"];
        }
    }

    static List<Data> fromList(List<Map<String, dynamic>> list) {
        return list.map(Data.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(searchResults != null) {
            _data["search_results"] = searchResults?.map((e) => e.toJson()).toList();
        }
        _data["discount_banner"] = discountBanner;
        if(content != null) {
            _data["content"] = content?.toJson();
        }
        if(filter != null) {
            _data["filter"] = filter?.map((e) => e.toJson()).toList();
        }
        if(sort != null) {
            _data["sort"] = sort?.map((e) => e.toJson()).toList();
        }
        _data["search_key"] = searchKey;
        if(searchContext != null) {
            _data["search_context"] = searchContext?.toJson();
        }
        _data["count"] = count;
        _data["is_genius_location"] = isGeniusLocation;
        return _data;
    }

    Data copyWith({
        List<SearchResults>? searchResults,
        dynamic discountBanner,
        Content1? content,
        List<Filter>? filter,
        List<Sort>? sort,
        String? searchKey,
        SearchContext? searchContext,
        int? count,
        bool? isGeniusLocation,
    }) => Data(
        searchResults: searchResults ?? this.searchResults,
        discountBanner: discountBanner ?? this.discountBanner,
        content: content ?? this.content,
        filter: filter ?? this.filter,
        sort: sort ?? this.sort,
        searchKey: searchKey ?? this.searchKey,
        searchContext: searchContext ?? this.searchContext,
        count: count ?? this.count,
        isGeniusLocation: isGeniusLocation ?? this.isGeniusLocation,
    );
}

class SearchContext {
    String? searchKey;
    String? searchId;
    String? recommendationsSearchUniqueId;

    SearchContext({this.searchKey, this.searchId, this.recommendationsSearchUniqueId});

    SearchContext.fromJson(Map<String, dynamic> json) {
        if(json["searchKey"] is String) {
            searchKey = json["searchKey"];
        }
        if(json["searchId"] is String) {
            searchId = json["searchId"];
        }
        if(json["recommendationsSearchUniqueId"] is String) {
            recommendationsSearchUniqueId = json["recommendationsSearchUniqueId"];
        }
    }

    static List<SearchContext> fromList(List<Map<String, dynamic>> list) {
        return list.map(SearchContext.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["searchKey"] = searchKey;
        _data["searchId"] = searchId;
        _data["recommendationsSearchUniqueId"] = recommendationsSearchUniqueId;
        return _data;
    }

    SearchContext copyWith({
        String? searchKey,
        String? searchId,
        String? recommendationsSearchUniqueId,
    }) => SearchContext(
        searchKey: searchKey ?? this.searchKey,
        searchId: searchId ?? this.searchId,
        recommendationsSearchUniqueId: recommendationsSearchUniqueId ?? this.recommendationsSearchUniqueId,
    );
}

class Sort {
    String? name;
    String? identifier;
    String? titleTag;

    Sort({this.name, this.identifier, this.titleTag});

    Sort.fromJson(Map<String, dynamic> json) {
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["identifier"] is String) {
            identifier = json["identifier"];
        }
        if(json["title_tag"] is String) {
            titleTag = json["title_tag"];
        }
    }

    static List<Sort> fromList(List<Map<String, dynamic>> list) {
        return list.map(Sort.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["identifier"] = identifier;
        _data["title_tag"] = titleTag;
        return _data;
    }

    Sort copyWith({
        String? name,
        String? identifier,
        String? titleTag,
    }) => Sort(
        name: name ?? this.name,
        identifier: identifier ?? this.identifier,
        titleTag: titleTag ?? this.titleTag,
    );
}

class Filter {
    String? title;
    String? id;
    String? type;
    Layout? layout;
    List<Categories>? categories;

    Filter({this.title, this.id, this.type, this.layout, this.categories});

    Filter.fromJson(Map<String, dynamic> json) {
        if(json["title"] is String) {
            title = json["title"];
        }
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["type"] is String) {
            type = json["type"];
        }
        if(json["layout"] is Map) {
            layout = json["layout"] == null ? null : Layout.fromJson(json["layout"]);
        }
        if(json["categories"] is List) {
            categories = json["categories"] == null ? null : (json["categories"] as List).map((e) => Categories.fromJson(e)).toList();
        }
    }

    static List<Filter> fromList(List<Map<String, dynamic>> list) {
        return list.map(Filter.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["title"] = title;
        _data["id"] = id;
        _data["type"] = type;
        if(layout != null) {
            _data["layout"] = layout?.toJson();
        }
        if(categories != null) {
            _data["categories"] = categories?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    Filter copyWith({
        String? title,
        String? id,
        String? type,
        Layout? layout,
        List<Categories>? categories,
    }) => Filter(
        title: title ?? this.title,
        id: id ?? this.id,
        type: type ?? this.type,
        layout: layout ?? this.layout,
        categories: categories ?? this.categories,
    );
}

class Categories {
    String? id;
    String? name;
    String? nameWithCount;
    int? count;

    Categories({this.id, this.name, this.nameWithCount, this.count});

    Categories.fromJson(Map<String, dynamic> json) {
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["nameWithCount"] is String) {
            nameWithCount = json["nameWithCount"];
        }
        if(json["count"] is num) {
            count = (json["count"] as num).toInt();
        }
    }

    static List<Categories> fromList(List<Map<String, dynamic>> list) {
        return list.map(Categories.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["nameWithCount"] = nameWithCount;
        _data["count"] = count;
        return _data;
    }

    Categories copyWith({
        String? id,
        String? name,
        String? nameWithCount,
        int? count,
    }) => Categories(
        id: id ?? this.id,
        name: name ?? this.name,
        nameWithCount: nameWithCount ?? this.nameWithCount,
        count: count ?? this.count,
    );
}

class Layout {
    String? isCollapsable;
    String? isCollapsed;
    int? collapsedCount;
    String? layoutType;

    Layout({this.isCollapsable, this.isCollapsed, this.collapsedCount, this.layoutType});

    Layout.fromJson(Map<String, dynamic> json) {
        if(json["is_collapsable"] is String) {
            isCollapsable = json["is_collapsable"];
        }
        if(json["is_collapsed"] is String) {
            isCollapsed = json["is_collapsed"];
        }
        if(json["collapsed_count"] is num) {
            collapsedCount = (json["collapsed_count"] as num).toInt();
        }
        if(json["layout_type"] is String) {
            layoutType = json["layout_type"];
        }
    }

    static List<Layout> fromList(List<Map<String, dynamic>> list) {
        return list.map(Layout.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["is_collapsable"] = isCollapsable;
        _data["is_collapsed"] = isCollapsed;
        _data["collapsed_count"] = collapsedCount;
        _data["layout_type"] = layoutType;
        return _data;
    }

    Layout copyWith({
        String? isCollapsable,
        String? isCollapsed,
        int? collapsedCount,
        String? layoutType,
    }) => Layout(
        isCollapsable: isCollapsable ?? this.isCollapsable,
        isCollapsed: isCollapsed ?? this.isCollapsed,
        collapsedCount: collapsedCount ?? this.collapsedCount,
        layoutType: layoutType ?? this.layoutType,
    );
}

class Content1 {
    dynamic discountBanner;
    dynamic dsaBanner;
    List<Items>? items;
    Filters? filters;
    CustomMap? map;

    Content1({this.discountBanner, this.dsaBanner, this.items, this.filters, this.map});

    Content1.fromJson(Map<String, dynamic> json) {
        discountBanner = json["discountBanner"];
        dsaBanner = json["dsaBanner"];
        if(json["items"] is List) {
            items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
        }
        if(json["filters"] is Map) {
            filters = json["filters"] == null ? null : Filters.fromJson(json["filters"]);
        }
        if(json["map"] is Map) {
            map = json["map"] == null ? null : CustomMap.fromJson(json["map"]);
        }
    }

    static List<Content1> fromList(List<Map<String, dynamic>> list) {
        return list.map(Content1.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["discountBanner"] = discountBanner;
        _data["dsaBanner"] = dsaBanner;
        if(items != null) {
            _data["items"] = items?.map((e) => e.toJson()).toList();
        }
        if(filters != null) {
            _data["filters"] = filters?.toJson();
        }
        if(map != null) {
            _data["map"] = map?.toJson();
        }
        return _data;
    }

    Content1 copyWith({
        dynamic discountBanner,
        dynamic dsaBanner,
        List<Items>? items,
        Filters? filters,
        CustomMap? map,
    }) => Content1(
        discountBanner: discountBanner ?? this.discountBanner,
        dsaBanner: dsaBanner ?? this.dsaBanner,
        items: items ?? this.items,
        filters: filters ?? this.filters,
        map: map ?? this.map,
    );
}

class CustomMap {
    List<SupplierLocations>? supplierLocations;

    CustomMap({this.supplierLocations});

    CustomMap.fromJson(Map<String, dynamic> json) {
        if(json["supplierLocations"] is List) {
            supplierLocations = json["supplierLocations"] == null ? null : (json["supplierLocations"] as List).map((e) => SupplierLocations.fromJson(e)).toList();
        }
    }

    static List<CustomMap> fromList(List<Map<String, dynamic>> list) {
        return list.map((e) => CustomMap.fromJson(e)).toList();
        // return list.map(Map.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(supplierLocations != null) {
            _data["supplierLocations"] = supplierLocations?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    CustomMap copyWith({
        List<SupplierLocations>? supplierLocations,
    }) => CustomMap(
        supplierLocations: supplierLocations ?? this.supplierLocations,
    );
}

class SupplierLocations {
    CarouselContent? carouselContent;
    SupplierPinContent? supplierPinContent;
    MetaData? metaData;

    SupplierLocations({this.carouselContent, this.supplierPinContent, this.metaData});

    SupplierLocations.fromJson(Map<String, dynamic> json) {
        if(json["carouselContent"] is Map) {
            carouselContent = json["carouselContent"] == null ? null : CarouselContent.fromJson(json["carouselContent"]);
        }
        if(json["supplierPinContent"] is Map) {
            supplierPinContent = json["supplierPinContent"] == null ? null : SupplierPinContent.fromJson(json["supplierPinContent"]);
        }
        if(json["metaData"] is Map) {
            metaData = json["metaData"] == null ? null : MetaData.fromJson(json["metaData"]);
        }
    }

    static List<SupplierLocations> fromList(List<Map<String, dynamic>> list) {
        return list.map(SupplierLocations.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(carouselContent != null) {
            _data["carouselContent"] = carouselContent?.toJson();
        }
        if(supplierPinContent != null) {
            _data["supplierPinContent"] = supplierPinContent?.toJson();
        }
        if(metaData != null) {
            _data["metaData"] = metaData?.toJson();
        }
        return _data;
    }

    SupplierLocations copyWith({
        CarouselContent? carouselContent,
        SupplierPinContent? supplierPinContent,
        MetaData? metaData,
    }) => SupplierLocations(
        carouselContent: carouselContent ?? this.carouselContent,
        supplierPinContent: supplierPinContent ?? this.supplierPinContent,
        metaData: metaData ?? this.metaData,
    );
}

class MetaData {
    String? locationName;
    String? locationHash;

    MetaData({this.locationName, this.locationHash});

    MetaData.fromJson(Map<String, dynamic> json) {
        if(json["locationName"] is String) {
            locationName = json["locationName"];
        }
        if(json["locationHash"] is String) {
            locationHash = json["locationHash"];
        }
    }

    static List<MetaData> fromList(List<Map<String, dynamic>> list) {
        return list.map(MetaData.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["locationName"] = locationName;
        _data["locationHash"] = locationHash;
        return _data;
    }

    MetaData copyWith({
        String? locationName,
        String? locationHash,
    }) => MetaData(
        locationName: locationName ?? this.locationName,
        locationHash: locationHash ?? this.locationHash,
    );
}

class SupplierPinContent {
    String? label;
    LatLong? latLong;
    Accessibility1? accessibility;

    SupplierPinContent({this.label, this.latLong, this.accessibility});

    SupplierPinContent.fromJson(Map<String, dynamic> json) {
        if(json["label"] is String) {
            label = json["label"];
        }
        if(json["latLong"] is Map) {
            latLong = json["latLong"] == null ? null : LatLong.fromJson(json["latLong"]);
        }
        if(json["accessibility"] is Map) {
            accessibility = json["accessibility"] == null ? null : Accessibility1.fromJson(json["accessibility"]);
        }
    }

    static List<SupplierPinContent> fromList(List<Map<String, dynamic>> list) {
        return list.map(SupplierPinContent.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["label"] = label;
        if(latLong != null) {
            _data["latLong"] = latLong?.toJson();
        }
        if(accessibility != null) {
            _data["accessibility"] = accessibility?.toJson();
        }
        return _data;
    }

    SupplierPinContent copyWith({
        String? label,
        LatLong? latLong,
        Accessibility1? accessibility,
    }) => SupplierPinContent(
        label: label ?? this.label,
        latLong: latLong ?? this.latLong,
        accessibility: accessibility ?? this.accessibility,
    );
}

class Accessibility1 {
    String? label;

    Accessibility1({this.label});

    Accessibility1.fromJson(Map<String, dynamic> json) {
        if(json["label"] is String) {
            label = json["label"];
        }
    }

    static List<Accessibility1> fromList(List<Map<String, dynamic>> list) {
        return list.map(Accessibility1.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["label"] = label;
        return _data;
    }

    Accessibility1 copyWith({
        String? label,
    }) => Accessibility1(
        label: label ?? this.label,
    );
}

class LatLong {
    double? latitude;
    double? longitude;

    LatLong({this.latitude, this.longitude});

    LatLong.fromJson(Map<String, dynamic> json) {
        if(json["latitude"] is num) {
            latitude = (json["latitude"] as num).toDouble();
        }
        if(json["longitude"] is num) {
            longitude = (json["longitude"] as num).toDouble();
        }
    }

    static List<LatLong> fromList(List<Map<String, dynamic>> list) {
        return list.map(LatLong.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["latitude"] = latitude;
        _data["longitude"] = longitude;
        return _data;
    }

    LatLong copyWith({
        double? latitude,
        double? longitude,
    }) => LatLong(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
    );
}

class CarouselContent {
    String? title;
    String? body;
    String? label;
    Footer? footer;

    CarouselContent({this.title, this.body, this.label, this.footer});

    CarouselContent.fromJson(Map<String, dynamic> json) {
        if(json["title"] is String) {
            title = json["title"];
        }
        if(json["body"] is String) {
            body = json["body"];
        }
        if(json["label"] is String) {
            label = json["label"];
        }
        if(json["footer"] is Map) {
            footer = json["footer"] == null ? null : Footer.fromJson(json["footer"]);
        }
    }

    static List<CarouselContent> fromList(List<Map<String, dynamic>> list) {
        return list.map(CarouselContent.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["title"] = title;
        _data["body"] = body;
        _data["label"] = label;
        if(footer != null) {
            _data["footer"] = footer?.toJson();
        }
        return _data;
    }

    CarouselContent copyWith({
        String? title,
        String? body,
        String? label,
        Footer? footer,
    }) => CarouselContent(
        title: title ?? this.title,
        body: body ?? this.body,
        label: label ?? this.label,
        footer: footer ?? this.footer,
    );
}

class Footer {
    String? label;
    String? price;

    Footer({this.label, this.price});

    Footer.fromJson(Map<String, dynamic> json) {
        if(json["label"] is String) {
            label = json["label"];
        }
        if(json["price"] is String) {
            price = json["price"];
        }
    }

    static List<Footer> fromList(List<Map<String, dynamic>> list) {
        return list.map(Footer.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["label"] = label;
        _data["price"] = price;
        return _data;
    }

    Footer copyWith({
        String? label,
        String? price,
    }) => Footer(
        label: label ?? this.label,
        price: price ?? this.price,
    );
}

class Filters {
    String? countLabel;

    Filters({this.countLabel});

    Filters.fromJson(Map<String, dynamic> json) {
        if(json["countLabel"] is String) {
            countLabel = json["countLabel"];
        }
    }

    static List<Filters> fromList(List<Map<String, dynamic>> list) {
        return list.map(Filters.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["countLabel"] = countLabel;
        return _data;
    }

    Filters copyWith({
        String? countLabel,
    }) => Filters(
        countLabel: countLabel ?? this.countLabel,
    );
}

class Items {
    String? type;
    int? positionInList;
    Content2? content;

    Items({this.type, this.positionInList, this.content});

    Items.fromJson(Map<String, dynamic> json) {
        if(json["type"] is String) {
            type = json["type"];
        }
        if(json["positionInList"] is num) {
            positionInList = (json["positionInList"] as num).toInt();
        }
        if(json["content"] is Map) {
            content = json["content"] == null ? null : Content2.fromJson(json["content"]);
        }
    }

    static List<Items> fromList(List<Map<String, dynamic>> list) {
        return list.map(Items.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["type"] = type;
        _data["positionInList"] = positionInList;
        if(content != null) {
            _data["content"] = content?.toJson();
        }
        return _data;
    }

    Items copyWith({
        String? type,
        int? positionInList,
        Content2? content,
    }) => Items(
        type: type ?? this.type,
        positionInList: positionInList ?? this.positionInList,
        content: content ?? this.content,
    );
}

class Content2 {
    String? label;

    Content2({this.label});

    Content2.fromJson(Map<String, dynamic> json) {
        if(json["label"] is String) {
            label = json["label"];
        }
    }

    static List<Content2> fromList(List<Map<String, dynamic>> list) {
        return list.map(Content2.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["label"] = label;
        return _data;
    }

    Content2 copyWith({
        String? label,
    }) => Content2(
        label: label ?? this.label,
    );
}

class SearchResults {
    Content? content;
    VehicleInfo? vehicleInfo;
    SupplierInfo? supplierInfo;
    RouteInfo? routeInfo;
    RatingInfo? ratingInfo;
    FeeInfo? feeInfo;
    List<dynamic>? freebies;
    PricingInfo? pricingInfo;
    Accessibility? accessibility;
    List<dynamic>? appliedDiscountTypes;

    SearchResults({this.content, this.vehicleInfo, this.supplierInfo, this.routeInfo, this.ratingInfo, this.feeInfo, this.freebies, this.pricingInfo, this.accessibility, this.appliedDiscountTypes});

    SearchResults.fromJson(Map<String, dynamic> json) {
        if(json["content"] is Map) {
            content = json["content"] == null ? null : Content.fromJson(json["content"]);
        }
        if(json["vehicle_info"] is Map) {
            vehicleInfo = json["vehicle_info"] == null ? null : VehicleInfo.fromJson(json["vehicle_info"]);
        }
        if(json["supplier_info"] is Map) {
            supplierInfo = json["supplier_info"] == null ? null : SupplierInfo.fromJson(json["supplier_info"]);
        }
        if(json["route_info"] is Map) {
            routeInfo = json["route_info"] == null ? null : RouteInfo.fromJson(json["route_info"]);
        }
        if(json["rating_info"] is Map) {
            ratingInfo = json["rating_info"] == null ? null : RatingInfo.fromJson(json["rating_info"]);
        }
        if(json["fee_info"] is Map) {
            feeInfo = json["fee_info"] == null ? null : FeeInfo.fromJson(json["fee_info"]);
        }
        if(json["freebies"] is List) {
            freebies = json["freebies"] ?? [];
        }
        if(json["pricing_info"] is Map) {
            pricingInfo = json["pricing_info"] == null ? null : PricingInfo.fromJson(json["pricing_info"]);
        }
        if(json["accessibility"] is Map) {
            accessibility = json["accessibility"] == null ? null : Accessibility.fromJson(json["accessibility"]);
        }
        if(json["applied_discount_types"] is List) {
            appliedDiscountTypes = json["applied_discount_types"] ?? [];
        }
    }

    static List<SearchResults> fromList(List<Map<String, dynamic>> list) {
        return list.map(SearchResults.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(content != null) {
            _data["content"] = content?.toJson();
        }
        if(vehicleInfo != null) {
            _data["vehicle_info"] = vehicleInfo?.toJson();
        }
        if(supplierInfo != null) {
            _data["supplier_info"] = supplierInfo?.toJson();
        }
        if(routeInfo != null) {
            _data["route_info"] = routeInfo?.toJson();
        }
        if(ratingInfo != null) {
            _data["rating_info"] = ratingInfo?.toJson();
        }
        if(feeInfo != null) {
            _data["fee_info"] = feeInfo?.toJson();
        }
        if(freebies != null) {
            _data["freebies"] = freebies;
        }
        if(pricingInfo != null) {
            _data["pricing_info"] = pricingInfo?.toJson();
        }
        if(accessibility != null) {
            _data["accessibility"] = accessibility?.toJson();
        }
        if(appliedDiscountTypes != null) {
            _data["applied_discount_types"] = appliedDiscountTypes;
        }
        return _data;
    }

    SearchResults copyWith({
        Content? content,
        VehicleInfo? vehicleInfo,
        SupplierInfo? supplierInfo,
        RouteInfo? routeInfo,
        RatingInfo? ratingInfo,
        FeeInfo? feeInfo,
        List<dynamic>? freebies,
        PricingInfo? pricingInfo,
        Accessibility? accessibility,
        List<dynamic>? appliedDiscountTypes,
    }) => SearchResults(
        content: content ?? this.content,
        vehicleInfo: vehicleInfo ?? this.vehicleInfo,
        supplierInfo: supplierInfo ?? this.supplierInfo,
        routeInfo: routeInfo ?? this.routeInfo,
        ratingInfo: ratingInfo ?? this.ratingInfo,
        feeInfo: feeInfo ?? this.feeInfo,
        freebies: freebies ?? this.freebies,
        pricingInfo: pricingInfo ?? this.pricingInfo,
        accessibility: accessibility ?? this.accessibility,
        appliedDiscountTypes: appliedDiscountTypes ?? this.appliedDiscountTypes,
    );
}

class Accessibility {
    String? transmission;
    String? fuelPolicy;
    String? supplierRating;
    String? pickUpLocation;

    Accessibility({this.transmission, this.fuelPolicy, this.supplierRating, this.pickUpLocation});

    Accessibility.fromJson(Map<String, dynamic> json) {
        if(json["transmission"] is String) {
            transmission = json["transmission"];
        }
        if(json["fuel_policy"] is String) {
            fuelPolicy = json["fuel_policy"];
        }
        if(json["supplier_rating"] is String) {
            supplierRating = json["supplier_rating"];
        }
        if(json["pick_up_location"] is String) {
            pickUpLocation = json["pick_up_location"];
        }
    }

    static List<Accessibility> fromList(List<Map<String, dynamic>> list) {
        return list.map(Accessibility.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["transmission"] = transmission;
        _data["fuel_policy"] = fuelPolicy;
        _data["supplier_rating"] = supplierRating;
        _data["pick_up_location"] = pickUpLocation;
        return _data;
    }

    Accessibility copyWith({
        String? transmission,
        String? fuelPolicy,
        String? supplierRating,
        String? pickUpLocation,
    }) => Accessibility(
        transmission: transmission ?? this.transmission,
        fuelPolicy: fuelPolicy ?? this.fuelPolicy,
        supplierRating: supplierRating ?? this.supplierRating,
        pickUpLocation: pickUpLocation ?? this.pickUpLocation,
    );
}

class PricingInfo {
    double? basePrice;
    double? driveAwayPrice;
    dynamic driveAwayPriceBefore;
    bool? driveAwayPriceIsApprox;
    double? deposit;
    int? discount;
    double? baseDeposit;
    String? baseCurrency;
    double? price;
    int? quoteAllowed;
    String? currency;
    FeeBreakdown? feeBreakdown;
    String? payWhen;

    PricingInfo({this.basePrice, this.driveAwayPrice, this.driveAwayPriceBefore, this.driveAwayPriceIsApprox, this.deposit, this.discount, this.baseDeposit, this.baseCurrency, this.price, this.quoteAllowed, this.currency, this.feeBreakdown, this.payWhen});

    PricingInfo.fromJson(Map<String, dynamic> json) {
        if(json["base_price"] is num) {
            basePrice = (json["base_price"] as num).toDouble();
        }
        if(json["drive_away_price"] is num) {
            driveAwayPrice = (json["drive_away_price"] as num).toDouble();
        }
        driveAwayPriceBefore = json["drive_away_price_before"];
        if(json["drive_away_price_is_approx"] is bool) {
            driveAwayPriceIsApprox = json["drive_away_price_is_approx"];
        }
        if(json["deposit"] is num) {
            deposit = (json["deposit"] as num).toDouble();
        }
        if(json["discount"] is num) {
            discount = (json["discount"] as num).toInt();
        }
        if(json["base_deposit"] is num) {
            baseDeposit = (json["base_deposit"] as num).toDouble();
        }
        if(json["base_currency"] is String) {
            baseCurrency = json["base_currency"];
        }
        if(json["price"] is num) {
            price = (json["price"] as num).toDouble();
        }
        if(json["quote_allowed"] is num) {
            quoteAllowed = (json["quote_allowed"] as num).toInt();
        }
        if(json["currency"] is String) {
            currency = json["currency"];
        }
        if(json["fee_breakdown"] is Map) {
            feeBreakdown = json["fee_breakdown"] == null ? null : FeeBreakdown.fromJson(json["fee_breakdown"]);
        }
        if(json["pay_when"] is String) {
            payWhen = json["pay_when"];
        }
    }

    static List<PricingInfo> fromList(List<Map<String, dynamic>> list) {
        return list.map(PricingInfo.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["base_price"] = basePrice;
        _data["drive_away_price"] = driveAwayPrice;
        _data["drive_away_price_before"] = driveAwayPriceBefore;
        _data["drive_away_price_is_approx"] = driveAwayPriceIsApprox;
        _data["deposit"] = deposit;
        _data["discount"] = discount;
        _data["base_deposit"] = baseDeposit;
        _data["base_currency"] = baseCurrency;
        _data["price"] = price;
        _data["quote_allowed"] = quoteAllowed;
        _data["currency"] = currency;
        if(feeBreakdown != null) {
            _data["fee_breakdown"] = feeBreakdown?.toJson();
        }
        _data["pay_when"] = payWhen;
        return _data;
    }

    PricingInfo copyWith({
        double? basePrice,
        double? driveAwayPrice,
        dynamic driveAwayPriceBefore,
        bool? driveAwayPriceIsApprox,
        double? deposit,
        int? discount,
        double? baseDeposit,
        String? baseCurrency,
        double? price,
        int? quoteAllowed,
        String? currency,
        FeeBreakdown? feeBreakdown,
        String? payWhen,
    }) => PricingInfo(
        basePrice: basePrice ?? this.basePrice,
        driveAwayPrice: driveAwayPrice ?? this.driveAwayPrice,
        driveAwayPriceBefore: driveAwayPriceBefore ?? this.driveAwayPriceBefore,
        driveAwayPriceIsApprox: driveAwayPriceIsApprox ?? this.driveAwayPriceIsApprox,
        deposit: deposit ?? this.deposit,
        discount: discount ?? this.discount,
        baseDeposit: baseDeposit ?? this.baseDeposit,
        baseCurrency: baseCurrency ?? this.baseCurrency,
        price: price ?? this.price,
        quoteAllowed: quoteAllowed ?? this.quoteAllowed,
        currency: currency ?? this.currency,
        feeBreakdown: feeBreakdown ?? this.feeBreakdown,
        payWhen: payWhen ?? this.payWhen,
    );
}

class FeeBreakdown {
    FuelPolicy? fuelPolicy;
    List<KnownFees>? knownFees;

    FeeBreakdown({this.fuelPolicy, this.knownFees});

    FeeBreakdown.fromJson(Map<String, dynamic> json) {
        if(json["fuel_policy"] is Map) {
            fuelPolicy = json["fuel_policy"] == null ? null : FuelPolicy.fromJson(json["fuel_policy"]);
        }
        if(json["known_fees"] is List) {
            knownFees = json["known_fees"] == null ? null : (json["known_fees"] as List).map((e) => KnownFees.fromJson(e)).toList();
        }
    }

    static List<FeeBreakdown> fromList(List<Map<String, dynamic>> list) {
        return list.map(FeeBreakdown.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(fuelPolicy != null) {
            _data["fuel_policy"] = fuelPolicy?.toJson();
        }
        if(knownFees != null) {
            _data["known_fees"] = knownFees?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    FeeBreakdown copyWith({
        FuelPolicy? fuelPolicy,
        List<KnownFees>? knownFees,
    }) => FeeBreakdown(
        fuelPolicy: fuelPolicy ?? this.fuelPolicy,
        knownFees: knownFees ?? this.knownFees,
    );
}

class KnownFees {
    String? type;
    dynamic distanceAllowed;
    int? isAlwaysPayable;
    int? isTaxIncluded;
    int? maxAmount;
    int? minAmount;
    int? amount;
    String? currency;

    KnownFees({this.type, this.distanceAllowed, this.isAlwaysPayable, this.isTaxIncluded, this.maxAmount, this.minAmount, this.amount, this.currency});

    KnownFees.fromJson(Map<String, dynamic> json) {
        if(json["type"] is String) {
            type = json["type"];
        }
        distanceAllowed = json["distance_allowed"];
        if(json["is_always_payable"] is num) {
            isAlwaysPayable = (json["is_always_payable"] as num).toInt();
        }
        if(json["is_tax_included"] is num) {
            isTaxIncluded = (json["is_tax_included"] as num).toInt();
        }
        if(json["max_amount"] is num) {
            maxAmount = (json["max_amount"] as num).toInt();
        }
        if(json["min_amount"] is num) {
            minAmount = (json["min_amount"] as num).toInt();
        }
        if(json["amount"] is num) {
            amount = (json["amount"] as num).toInt();
        }
        if(json["currency"] is String) {
            currency = json["currency"];
        }
    }

    static List<KnownFees> fromList(List<Map<String, dynamic>> list) {
        return list.map(KnownFees.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["type"] = type;
        _data["distance_allowed"] = distanceAllowed;
        _data["is_always_payable"] = isAlwaysPayable;
        _data["is_tax_included"] = isTaxIncluded;
        _data["max_amount"] = maxAmount;
        _data["min_amount"] = minAmount;
        _data["amount"] = amount;
        _data["currency"] = currency;
        return _data;
    }

    KnownFees copyWith({
        String? type,
        dynamic distanceAllowed,
        int? isAlwaysPayable,
        int? isTaxIncluded,
        int? maxAmount,
        int? minAmount,
        int? amount,
        String? currency,
    }) => KnownFees(
        type: type ?? this.type,
        distanceAllowed: distanceAllowed ?? this.distanceAllowed,
        isAlwaysPayable: isAlwaysPayable ?? this.isAlwaysPayable,
        isTaxIncluded: isTaxIncluded ?? this.isTaxIncluded,
        maxAmount: maxAmount ?? this.maxAmount,
        minAmount: minAmount ?? this.minAmount,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
    );
}

class FuelPolicy {
    String? type;
    int? amount;
    String? currency;

    FuelPolicy({this.type, this.amount, this.currency});

    FuelPolicy.fromJson(Map<String, dynamic> json) {
        if(json["type"] is String) {
            type = json["type"];
        }
        if(json["amount"] is num) {
            amount = (json["amount"] as num).toInt();
        }
        if(json["currency"] is String) {
            currency = json["currency"];
        }
    }

    static List<FuelPolicy> fromList(List<Map<String, dynamic>> list) {
        return list.map(FuelPolicy.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["type"] = type;
        _data["amount"] = amount;
        _data["currency"] = currency;
        return _data;
    }

    FuelPolicy copyWith({
        String? type,
        int? amount,
        String? currency,
    }) => FuelPolicy(
        type: type ?? this.type,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
    );
}

class FeeInfo {
    String? type;
    int? tax;
    String? currency;
    int? fee;

    FeeInfo({this.type, this.tax, this.currency, this.fee});

    FeeInfo.fromJson(Map<String, dynamic> json) {
        if(json["type"] is String) {
            type = json["type"];
        }
        if(json["tax"] is num) {
            tax = (json["tax"] as num).toInt();
        }
        if(json["currency"] is String) {
            currency = json["currency"];
        }
        if(json["fee"] is num) {
            fee = (json["fee"] as num).toInt();
        }
    }

    static List<FeeInfo> fromList(List<Map<String, dynamic>> list) {
        return list.map(FeeInfo.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["type"] = type;
        _data["tax"] = tax;
        _data["currency"] = currency;
        _data["fee"] = fee;
        return _data;
    }

    FeeInfo copyWith({
        String? type,
        int? tax,
        String? currency,
        int? fee,
    }) => FeeInfo(
        type: type ?? this.type,
        tax: tax ?? this.tax,
        currency: currency ?? this.currency,
        fee: fee ?? this.fee,
    );
}

class RatingInfo {
    double? average;
    String? averageText;
    int? condition;
    double? location;
    int? cleanliness;
    int? efficiency;
    double? valueForMoney;
    double? pickupTime;
    double? dropoffTime;
    int? noOfRatings;

    RatingInfo({this.average, this.averageText, this.condition, this.location, this.cleanliness, this.efficiency, this.valueForMoney, this.pickupTime, this.dropoffTime, this.noOfRatings});

    RatingInfo.fromJson(Map<String, dynamic> json) {
        if(json["average"] is num) {
            average = (json["average"] as num).toDouble();
        }
        if(json["average_text"] is String) {
            averageText = json["average_text"];
        }
        if(json["condition"] is num) {
            condition = (json["condition"] as num).toInt();
        }
        if(json["location"] is num) {
            location = (json["location"] as num).toDouble();
        }
        if(json["cleanliness"] is num) {
            cleanliness = (json["cleanliness"] as num).toInt();
        }
        if(json["efficiency"] is num) {
            efficiency = (json["efficiency"] as num).toInt();
        }
        if(json["value_for_money"] is num) {
            valueForMoney = (json["value_for_money"] as num).toDouble();
        }
        if(json["pickup_time"] is num) {
            pickupTime = (json["pickup_time"] as num).toDouble();
        }
        if(json["dropoff_time"] is num) {
            dropoffTime = (json["dropoff_time"] as num).toDouble();
        }
        if(json["no_of_ratings"] is num) {
            noOfRatings = (json["no_of_ratings"] as num).toInt();
        }
    }

    static List<RatingInfo> fromList(List<Map<String, dynamic>> list) {
        return list.map(RatingInfo.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["average"] = average;
        _data["average_text"] = averageText;
        _data["condition"] = condition;
        _data["location"] = location;
        _data["cleanliness"] = cleanliness;
        _data["efficiency"] = efficiency;
        _data["value_for_money"] = valueForMoney;
        _data["pickup_time"] = pickupTime;
        _data["dropoff_time"] = dropoffTime;
        _data["no_of_ratings"] = noOfRatings;
        return _data;
    }

    RatingInfo copyWith({
        double? average,
        String? averageText,
        int? condition,
        double? location,
        int? cleanliness,
        int? efficiency,
        double? valueForMoney,
        double? pickupTime,
        double? dropoffTime,
        int? noOfRatings,
    }) => RatingInfo(
        average: average ?? this.average,
        averageText: averageText ?? this.averageText,
        condition: condition ?? this.condition,
        location: location ?? this.location,
        cleanliness: cleanliness ?? this.cleanliness,
        efficiency: efficiency ?? this.efficiency,
        valueForMoney: valueForMoney ?? this.valueForMoney,
        pickupTime: pickupTime ?? this.pickupTime,
        dropoffTime: dropoffTime ?? this.dropoffTime,
        noOfRatings: noOfRatings ?? this.noOfRatings,
    );
}

class RouteInfo {
    Pickup? pickup;
    Dropoff? dropoff;

    RouteInfo({this.pickup, this.dropoff});

    RouteInfo.fromJson(Map<String, dynamic> json) {
        if(json["pickup"] is Map) {
            pickup = json["pickup"] == null ? null : Pickup.fromJson(json["pickup"]);
        }
        if(json["dropoff"] is Map) {
            dropoff = json["dropoff"] == null ? null : Dropoff.fromJson(json["dropoff"]);
        }
    }

    static List<RouteInfo> fromList(List<Map<String, dynamic>> list) {
        return list.map(RouteInfo.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(pickup != null) {
            _data["pickup"] = pickup?.toJson();
        }
        if(dropoff != null) {
            _data["dropoff"] = dropoff?.toJson();
        }
        return _data;
    }

    RouteInfo copyWith({
        Pickup? pickup,
        Dropoff? dropoff,
    }) => RouteInfo(
        pickup: pickup ?? this.pickup,
        dropoff: dropoff ?? this.dropoff,
    );
}

class Dropoff {
    String? name;
    String? longitude;
    String? locationType;
    String? locationId;
    String? latitude;
    String? icon;
    String? countryCode;
    String? country;
    String? address;
    String? city;
    String? locationHash;

    Dropoff({this.name, this.longitude, this.locationType, this.locationId, this.latitude, this.icon, this.countryCode, this.country, this.address, this.city, this.locationHash});

    Dropoff.fromJson(Map<String, dynamic> json) {
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["longitude"] is String) {
            longitude = json["longitude"];
        }
        if(json["location_type"] is String) {
            locationType = json["location_type"];
        }
        if(json["location_id"] is String) {
            locationId = json["location_id"];
        }
        if(json["latitude"] is String) {
            latitude = json["latitude"];
        }
        if(json["icon"] is String) {
            icon = json["icon"];
        }
        if(json["country_code"] is String) {
            countryCode = json["country_code"];
        }
        if(json["country"] is String) {
            country = json["country"];
        }
        if(json["address"] is String) {
            address = json["address"];
        }
        if(json["city"] is String) {
            city = json["city"];
        }
        if(json["location_hash"] is String) {
            locationHash = json["location_hash"];
        }
    }

    static List<Dropoff> fromList(List<Map<String, dynamic>> list) {
        return list.map(Dropoff.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["longitude"] = longitude;
        _data["location_type"] = locationType;
        _data["location_id"] = locationId;
        _data["latitude"] = latitude;
        _data["icon"] = icon;
        _data["country_code"] = countryCode;
        _data["country"] = country;
        _data["address"] = address;
        _data["city"] = city;
        _data["location_hash"] = locationHash;
        return _data;
    }

    Dropoff copyWith({
        String? name,
        String? longitude,
        String? locationType,
        String? locationId,
        String? latitude,
        String? icon,
        String? countryCode,
        String? country,
        String? address,
        String? city,
        String? locationHash,
    }) => Dropoff(
        name: name ?? this.name,
        longitude: longitude ?? this.longitude,
        locationType: locationType ?? this.locationType,
        locationId: locationId ?? this.locationId,
        latitude: latitude ?? this.latitude,
        icon: icon ?? this.icon,
        countryCode: countryCode ?? this.countryCode,
        country: country ?? this.country,
        address: address ?? this.address,
        city: city ?? this.city,
        locationHash: locationHash ?? this.locationHash,
    );
}

class Pickup {
    String? name;
    String? longitude;
    String? locationType;
    String? locationId;
    String? latitude;
    String? icon;
    String? countryCode;
    String? country;
    String? address;
    String? city;
    String? locationHash;

    Pickup({this.name, this.longitude, this.locationType, this.locationId, this.latitude, this.icon, this.countryCode, this.country, this.address, this.city, this.locationHash});

    Pickup.fromJson(Map<String, dynamic> json) {
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["longitude"] is String) {
            longitude = json["longitude"];
        }
        if(json["location_type"] is String) {
            locationType = json["location_type"];
        }
        if(json["location_id"] is String) {
            locationId = json["location_id"];
        }
        if(json["latitude"] is String) {
            latitude = json["latitude"];
        }
        if(json["icon"] is String) {
            icon = json["icon"];
        }
        if(json["country_code"] is String) {
            countryCode = json["country_code"];
        }
        if(json["country"] is String) {
            country = json["country"];
        }
        if(json["address"] is String) {
            address = json["address"];
        }
        if(json["city"] is String) {
            city = json["city"];
        }
        if(json["location_hash"] is String) {
            locationHash = json["location_hash"];
        }
    }

    static List<Pickup> fromList(List<Map<String, dynamic>> list) {
        return list.map(Pickup.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["longitude"] = longitude;
        _data["location_type"] = locationType;
        _data["location_id"] = locationId;
        _data["latitude"] = latitude;
        _data["icon"] = icon;
        _data["country_code"] = countryCode;
        _data["country"] = country;
        _data["address"] = address;
        _data["city"] = city;
        _data["location_hash"] = locationHash;
        return _data;
    }

    Pickup copyWith({
        String? name,
        String? longitude,
        String? locationType,
        String? locationId,
        String? latitude,
        String? icon,
        String? countryCode,
        String? country,
        String? address,
        String? city,
        String? locationHash,
    }) => Pickup(
        name: name ?? this.name,
        longitude: longitude ?? this.longitude,
        locationType: locationType ?? this.locationType,
        locationId: locationId ?? this.locationId,
        latitude: latitude ?? this.latitude,
        icon: icon ?? this.icon,
        countryCode: countryCode ?? this.countryCode,
        country: country ?? this.country,
        address: address ?? this.address,
        city: city ?? this.city,
        locationHash: locationHash ?? this.locationHash,
    );
}

class SupplierInfo {
    String? name;
    String? logoUrl;
    String? locationType;
    String? address;
    String? latitude;
    String? longitude;
    String? pickupInstructions;
    String? dropoffInstructions;
    bool? mayRequireCreditCardGuarantee;

    SupplierInfo({this.name, this.logoUrl, this.locationType, this.address, this.latitude, this.longitude, this.pickupInstructions, this.dropoffInstructions, this.mayRequireCreditCardGuarantee});

    SupplierInfo.fromJson(Map<String, dynamic> json) {
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["logo_url"] is String) {
            logoUrl = json["logo_url"];
        }
        if(json["location_type"] is String) {
            locationType = json["location_type"];
        }
        if(json["address"] is String) {
            address = json["address"];
        }
        if(json["latitude"] is String) {
            latitude = json["latitude"];
        }
        if(json["longitude"] is String) {
            longitude = json["longitude"];
        }
        if(json["pickup_instructions"] is String) {
            pickupInstructions = json["pickup_instructions"];
        }
        if(json["dropoff_instructions"] is String) {
            dropoffInstructions = json["dropoff_instructions"];
        }
        if(json["may_require_credit_card_guarantee"] is bool) {
            mayRequireCreditCardGuarantee = json["may_require_credit_card_guarantee"];
        }
    }

    static List<SupplierInfo> fromList(List<Map<String, dynamic>> list) {
        return list.map(SupplierInfo.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["logo_url"] = logoUrl;
        _data["location_type"] = locationType;
        _data["address"] = address;
        _data["latitude"] = latitude;
        _data["longitude"] = longitude;
        _data["pickup_instructions"] = pickupInstructions;
        _data["dropoff_instructions"] = dropoffInstructions;
        _data["may_require_credit_card_guarantee"] = mayRequireCreditCardGuarantee;
        return _data;
    }

    SupplierInfo copyWith({
        String? name,
        String? logoUrl,
        String? locationType,
        String? address,
        String? latitude,
        String? longitude,
        String? pickupInstructions,
        String? dropoffInstructions,
        bool? mayRequireCreditCardGuarantee,
    }) => SupplierInfo(
        name: name ?? this.name,
        logoUrl: logoUrl ?? this.logoUrl,
        locationType: locationType ?? this.locationType,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        pickupInstructions: pickupInstructions ?? this.pickupInstructions,
        dropoffInstructions: dropoffInstructions ?? this.dropoffInstructions,
        mayRequireCreditCardGuarantee: mayRequireCreditCardGuarantee ?? this.mayRequireCreditCardGuarantee,
    );
}

class VehicleInfo {
    String? vId;
    String? vName;
    int? unlimitedMileage;
    String? transmission;
    dynamic specialOfferText;
    String? seats;
    Suitcases? suitcases;
    String? label;
    String? insurancePackage;
    String? imageUrl;
    String? imageThumbnailUrl;
    String? group;
    String? groupOrSimilar;
    String? fuelType;
    String? fuelPolicyDescription;
    String? fuelPolicy;
    int? freeCancellation;
    String? doors;
    int? cmaCompliant;
    int? aircon;
    int? airbags;
    String? mileage;
    Badges? badges;
    dynamic deposit;

    VehicleInfo({this.vId, this.vName, this.unlimitedMileage, this.transmission, this.specialOfferText, this.seats, this.suitcases, this.label, this.insurancePackage, this.imageUrl, this.imageThumbnailUrl, this.group, this.groupOrSimilar, this.fuelType, this.fuelPolicyDescription, this.fuelPolicy, this.freeCancellation, this.doors, this.cmaCompliant, this.aircon, this.airbags, this.mileage, this.badges, this.deposit});

    VehicleInfo.fromJson(Map<String, dynamic> json) {
        if(json["v_id"] is String) {
            vId = json["v_id"];
        }
        if(json["v_name"] is String) {
            vName = json["v_name"];
        }
        if(json["unlimited_mileage"] is num) {
            unlimitedMileage = (json["unlimited_mileage"] as num).toInt();
        }
        if(json["transmission"] is String) {
            transmission = json["transmission"];
        }
        specialOfferText = json["special_offer_text"];
        if(json["seats"] is String) {
            seats = json["seats"];
        }
        if(json["suitcases"] is Map) {
            suitcases = json["suitcases"] == null ? null : Suitcases.fromJson(json["suitcases"]);
        }
        if(json["label"] is String) {
            label = json["label"];
        }
        if(json["insurance_package"] is String) {
            insurancePackage = json["insurance_package"];
        }
        if(json["image_url"] is String) {
            imageUrl = json["image_url"];
        }
        if(json["image_thumbnail_url"] is String) {
            imageThumbnailUrl = json["image_thumbnail_url"];
        }
        if(json["group"] is String) {
            group = json["group"];
        }
        if(json["group_or_similar"] is String) {
            groupOrSimilar = json["group_or_similar"];
        }
        if(json["fuel_type"] is String) {
            fuelType = json["fuel_type"];
        }
        if(json["fuel_policy_description"] is String) {
            fuelPolicyDescription = json["fuel_policy_description"];
        }
        if(json["fuel_policy"] is String) {
            fuelPolicy = json["fuel_policy"];
        }
        if(json["free_cancellation"] is num) {
            freeCancellation = (json["free_cancellation"] as num).toInt();
        }
        if(json["doors"] is String) {
            doors = json["doors"];
        }
        if(json["cma_compliant"] is num) {
            cmaCompliant = (json["cma_compliant"] as num).toInt();
        }
        if(json["aircon"] is num) {
            aircon = (json["aircon"] as num).toInt();
        }
        if(json["airbags"] is num) {
            airbags = (json["airbags"] as num).toInt();
        }
        if(json["mileage"] is String) {
            mileage = json["mileage"];
        }
        if(json["badges"] is Map) {
            badges = json["badges"] == null ? null : Badges.fromJson(json["badges"]);
        }
        deposit = json["deposit"];
    }

    static List<VehicleInfo> fromList(List<Map<String, dynamic>> list) {
        return list.map(VehicleInfo.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["v_id"] = vId;
        _data["v_name"] = vName;
        _data["unlimited_mileage"] = unlimitedMileage;
        _data["transmission"] = transmission;
        _data["special_offer_text"] = specialOfferText;
        _data["seats"] = seats;
        if(suitcases != null) {
            _data["suitcases"] = suitcases?.toJson();
        }
        _data["label"] = label;
        _data["insurance_package"] = insurancePackage;
        _data["image_url"] = imageUrl;
        _data["image_thumbnail_url"] = imageThumbnailUrl;
        _data["group"] = group;
        _data["group_or_similar"] = groupOrSimilar;
        _data["fuel_type"] = fuelType;
        _data["fuel_policy_description"] = fuelPolicyDescription;
        _data["fuel_policy"] = fuelPolicy;
        _data["free_cancellation"] = freeCancellation;
        _data["doors"] = doors;
        _data["cma_compliant"] = cmaCompliant;
        _data["aircon"] = aircon;
        _data["airbags"] = airbags;
        _data["mileage"] = mileage;
        if(badges != null) {
            _data["badges"] = badges?.toJson();
        }
        _data["deposit"] = deposit;
        return _data;
    }

    VehicleInfo copyWith({
        String? vId,
        String? vName,
        int? unlimitedMileage,
        String? transmission,
        dynamic specialOfferText,
        String? seats,
        Suitcases? suitcases,
        String? label,
        String? insurancePackage,
        String? imageUrl,
        String? imageThumbnailUrl,
        String? group,
        String? groupOrSimilar,
        String? fuelType,
        String? fuelPolicyDescription,
        String? fuelPolicy,
        int? freeCancellation,
        String? doors,
        int? cmaCompliant,
        int? aircon,
        int? airbags,
        String? mileage,
        Badges? badges,
        dynamic deposit,
    }) => VehicleInfo(
        vId: vId ?? this.vId,
        vName: vName ?? this.vName,
        unlimitedMileage: unlimitedMileage ?? this.unlimitedMileage,
        transmission: transmission ?? this.transmission,
        specialOfferText: specialOfferText ?? this.specialOfferText,
        seats: seats ?? this.seats,
        suitcases: suitcases ?? this.suitcases,
        label: label ?? this.label,
        insurancePackage: insurancePackage ?? this.insurancePackage,
        imageUrl: imageUrl ?? this.imageUrl,
        imageThumbnailUrl: imageThumbnailUrl ?? this.imageThumbnailUrl,
        group: group ?? this.group,
        groupOrSimilar: groupOrSimilar ?? this.groupOrSimilar,
        fuelType: fuelType ?? this.fuelType,
        fuelPolicyDescription: fuelPolicyDescription ?? this.fuelPolicyDescription,
        fuelPolicy: fuelPolicy ?? this.fuelPolicy,
        freeCancellation: freeCancellation ?? this.freeCancellation,
        doors: doors ?? this.doors,
        cmaCompliant: cmaCompliant ?? this.cmaCompliant,
        aircon: aircon ?? this.aircon,
        airbags: airbags ?? this.airbags,
        mileage: mileage ?? this.mileage,
        badges: badges ?? this.badges,
        deposit: deposit ?? this.deposit,
    );
}

class Badges {
    Badges();

    Badges.fromJson(Map<String, dynamic> json) {

    }

    static List<Badges> fromList(List<Map<String, dynamic>> list) {
        return list.map(Badges.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};

        return _data;
    }

    Badges copyWith(){
      return Badges();
    }
}

class Suitcases {
    String? big;
    String? small;

    Suitcases({this.big, this.small});

    Suitcases.fromJson(Map<String, dynamic> json) {
        if(json["big"] is String) {
            big = json["big"];
        }
        if(json["small"] is String) {
            small = json["small"];
        }
    }

    static List<Suitcases> fromList(List<Map<String, dynamic>> list) {
        return list.map(Suitcases.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["big"] = big;
        _data["small"] = small;
        return _data;
    }

    Suitcases copyWith({
        String? big,
        String? small,
    }) => Suitcases(
        big: big ?? this.big,
        small: small ?? this.small,
    );
}

class Content {
    List<dynamic>? badges;
    Supplier? supplier;
    List<VehicleSpecs>? vehicleSpecs;

    Content({this.badges, this.supplier, this.vehicleSpecs});

    Content.fromJson(Map<String, dynamic> json) {
        if(json["badges"] is List) {
            badges = json["badges"] ?? [];
        }
        if(json["supplier"] is Map) {
            supplier = json["supplier"] == null ? null : Supplier.fromJson(json["supplier"]);
        }
        if(json["vehicleSpecs"] is List) {
            vehicleSpecs = json["vehicleSpecs"] == null ? null : (json["vehicleSpecs"] as List).map((e) => VehicleSpecs.fromJson(e)).toList();
        }
    }

    static List<Content> fromList(List<Map<String, dynamic>> list) {
        return list.map(Content.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(badges != null) {
            _data["badges"] = badges;
        }
        if(supplier != null) {
            _data["supplier"] = supplier?.toJson();
        }
        if(vehicleSpecs != null) {
            _data["vehicleSpecs"] = vehicleSpecs?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    Content copyWith({
        List<dynamic>? badges,
        Supplier? supplier,
        List<VehicleSpecs>? vehicleSpecs,
    }) => Content(
        badges: badges ?? this.badges,
        supplier: supplier ?? this.supplier,
        vehicleSpecs: vehicleSpecs ?? this.vehicleSpecs,
    );
}

class VehicleSpecs {
    String? text;
    String? icon;
    String? accessibility;

    VehicleSpecs({this.text, this.icon, this.accessibility});

    VehicleSpecs.fromJson(Map<String, dynamic> json) {
        if(json["text"] is String) {
            text = json["text"];
        }
        if(json["icon"] is String) {
            icon = json["icon"];
        }
        if(json["accessibility"] is String) {
            accessibility = json["accessibility"];
        }
    }

    static List<VehicleSpecs> fromList(List<Map<String, dynamic>> list) {
        return list.map(VehicleSpecs.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["text"] = text;
        _data["icon"] = icon;
        _data["accessibility"] = accessibility;
        return _data;
    }

    VehicleSpecs copyWith({
        String? text,
        String? icon,
        String? accessibility,
    }) => VehicleSpecs(
        text: text ?? this.text,
        icon: icon ?? this.icon,
        accessibility: accessibility ?? this.accessibility,
    );
}

class Supplier {
    String? name;
    String? imageUrl;
    Rating? rating;

    Supplier({this.name, this.imageUrl, this.rating});

    Supplier.fromJson(Map<String, dynamic> json) {
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["imageUrl"] is String) {
            imageUrl = json["imageUrl"];
        }
        if(json["rating"] is Map) {
            rating = json["rating"] == null ? null : Rating.fromJson(json["rating"]);
        }
    }

    static List<Supplier> fromList(List<Map<String, dynamic>> list) {
        return list.map(Supplier.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["imageUrl"] = imageUrl;
        if(rating != null) {
            _data["rating"] = rating?.toJson();
        }
        return _data;
    }

    Supplier copyWith({
        String? name,
        String? imageUrl,
        Rating? rating,
    }) => Supplier(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        rating: rating ?? this.rating,
    );
}

class Rating {
    String? average;
    LocalisedRating? localisedRating;
    String? title;
    String? subtitle;

    Rating({this.average, this.localisedRating, this.title, this.subtitle});

    Rating.fromJson(Map<String, dynamic> json) {
        if(json["average"] is String) {
            average = json["average"];
        }
        if(json["localisedRating"] is Map) {
            localisedRating = json["localisedRating"] == null ? null : LocalisedRating.fromJson(json["localisedRating"]);
        }
        if(json["title"] is String) {
            title = json["title"];
        }
        if(json["subtitle"] is String) {
            subtitle = json["subtitle"];
        }
    }

    static List<Rating> fromList(List<Map<String, dynamic>> list) {
        return list.map(Rating.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["average"] = average;
        if(localisedRating != null) {
            _data["localisedRating"] = localisedRating?.toJson();
        }
        _data["title"] = title;
        _data["subtitle"] = subtitle;
        return _data;
    }

    Rating copyWith({
        String? average,
        LocalisedRating? localisedRating,
        String? title,
        String? subtitle,
    }) => Rating(
        average: average ?? this.average,
        localisedRating: localisedRating ?? this.localisedRating,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
    );
}

class LocalisedRating {
    double? rawValue;
    String? displayValue;

    LocalisedRating({this.rawValue, this.displayValue});

    LocalisedRating.fromJson(Map<String, dynamic> json) {
        if(json["rawValue"] is num) {
            rawValue = (json["rawValue"] as num).toDouble();
        }
        if(json["displayValue"] is String) {
            displayValue = json["displayValue"];
        }
    }

    static List<LocalisedRating> fromList(List<Map<String, dynamic>> list) {
        return list.map(LocalisedRating.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["rawValue"] = rawValue;
        _data["displayValue"] = displayValue;
        return _data;
    }

    LocalisedRating copyWith({
        double? rawValue,
        String? displayValue,
    }) => LocalisedRating(
        rawValue: rawValue ?? this.rawValue,
        displayValue: displayValue ?? this.displayValue,
    );
}
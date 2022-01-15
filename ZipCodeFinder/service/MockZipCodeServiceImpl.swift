//
// Created by Del Edwards on 1/15/22.
//

import Foundation
import RxSwift
import SwiftyJSON

struct MockZipCodeServiceImpl : ZipCodeService {

    func findZipCode(zip: String, distance: String) -> Single<RestResult<Array<ZipCode>>> {

        print("in mock service")
        return Single<RestResult<Array<ZipCode>>>.create { single in

            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    sleep(5)
                }
                let ret = prepareData(jsonStr: MockZipCodeServiceImpl.zip30075_60_km)
                //fix this
                single(.success(.success(ret!)))
            }
            return Disposables.create()
        }
    }

    private func prepareData(jsonStr: String) -> [ZipCode]! {



        if let dataFromString = jsonStr.data(using: .utf8, allowLossyConversion: false) {
            let json = try! JSON(data: dataFromString)

            let foo = RootClass.init(fromJson: json)
            return foo.zipCodes
        } else {
            return []
        }
    }

    static let zip30075_60_km = """
                                {
                                    "zip_codes": [
                                        {
                                            "zip_code": "30237",
                                            "distance": 59.614,
                                            "city": "Jonesboro",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30236",
                                            "distance": 59.298,
                                            "city": "Jonesboro",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30274",
                                            "distance": 55.657,
                                            "city": "Riverdale",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30296",
                                            "distance": 54.897,
                                            "city": "Riverdale",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30281",
                                            "distance": 57.151,
                                            "city": "Stockbridge",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30374",
                                            "distance": 53.937,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30287",
                                            "distance": 54.138,
                                            "city": "Morrow",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30291",
                                            "distance": 55.137,
                                            "city": "Union City",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30273",
                                            "distance": 53.545,
                                            "city": "Rex",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30260",
                                            "distance": 52.629,
                                            "city": "Morrow",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30213",
                                            "distance": 56.57,
                                            "city": "Fairburn",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30298",
                                            "distance": 49.628,
                                            "city": "Forest Park",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30094",
                                            "distance": 58.308,
                                            "city": "Conyers",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30297",
                                            "distance": 48.866,
                                            "city": "Forest Park",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30272",
                                            "distance": 50.068,
                                            "city": "Red Oak",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30349",
                                            "distance": 49.656,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30320",
                                            "distance": 47.407,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30294",
                                            "distance": 47.551,
                                            "city": "Ellenwood",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30304",
                                            "distance": 46.151,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30380",
                                            "distance": 46.151,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30386",
                                            "distance": 46.151,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30396",
                                            "distance": 46.151,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30398",
                                            "distance": 46.151,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30049",
                                            "distance": 47.702,
                                            "city": "Lawrenceville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30337",
                                            "distance": 46.466,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30013",
                                            "distance": 59.743,
                                            "city": "Conyers",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30288",
                                            "distance": 45.102,
                                            "city": "Conley",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30354",
                                            "distance": 43.763,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30038",
                                            "distance": 49.004,
                                            "city": "Lithonia",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30364",
                                            "distance": 43.303,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30135",
                                            "distance": 53.255,
                                            "city": "Douglasville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30344",
                                            "distance": 42.612,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30034",
                                            "distance": 42.55,
                                            "city": "Decatur",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30330",
                                            "distance": 39.649,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30073",
                                            "distance": 41.553,
                                            "city": "Decatur",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30315",
                                            "distance": 39.176,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30331",
                                            "distance": 41.17,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30316",
                                            "distance": 38.58,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30012",
                                            "distance": 51.848,
                                            "city": "Conyers",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31136",
                                            "distance": 41.165,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30311",
                                            "distance": 37.727,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30035",
                                            "distance": 40.58,
                                            "city": "Decatur",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30310",
                                            "distance": 36.672,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30074",
                                            "distance": 42.422,
                                            "city": "Redan",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30336",
                                            "distance": 38.819,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30133",
                                            "distance": 47.623,
                                            "city": "Douglasville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30154",
                                            "distance": 47.623,
                                            "city": "Douglasville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30379",
                                            "distance": 35.047,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30387",
                                            "distance": 35.047,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30389",
                                            "distance": 35.047,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30390",
                                            "distance": 35.047,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30399",
                                            "distance": 35.047,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31120",
                                            "distance": 35.047,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31197",
                                            "distance": 35.047,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31198",
                                            "distance": 35.047,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31199",
                                            "distance": 35.047,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30058",
                                            "distance": 43.576,
                                            "city": "Lithonia",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30032",
                                            "distance": 36.843,
                                            "city": "Decatur",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30312",
                                            "distance": 34.533,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30317",
                                            "distance": 34.838,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30334",
                                            "distance": 34.047,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30302",
                                            "distance": 33.933,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30321",
                                            "distance": 33.933,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30343",
                                            "distance": 33.933,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30353",
                                            "distance": 33.933,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30370",
                                            "distance": 33.933,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30392",
                                            "distance": 33.933,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30394",
                                            "distance": 33.933,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30303",
                                            "distance": 33.556,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30088",
                                            "distance": 38.393,
                                            "city": "Stone Mountain",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30314",
                                            "distance": 33.303,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30358",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30362",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30368",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30371",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30377",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30378",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30385",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30388",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31106",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31107",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31119",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31126",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31131",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31139",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31141",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31145",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31146",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31150",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31156",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31192",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31193",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31195",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31196",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "39901",
                                            "distance": 32.925,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30313",
                                            "distance": 32.313,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30122",
                                            "distance": 39.533,
                                            "city": "Lithia Springs",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30375",
                                            "distance": 31.71,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30031",
                                            "distance": 33.018,
                                            "city": "Decatur",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30036",
                                            "distance": 33.018,
                                            "city": "Decatur",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30037",
                                            "distance": 33.018,
                                            "city": "Decatur",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30308",
                                            "distance": 31.594,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30307",
                                            "distance": 32.006,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30030",
                                            "distance": 32.811,
                                            "city": "Decatur",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30002",
                                            "distance": 33.509,
                                            "city": "Avondale Estates",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30134",
                                            "distance": 47.461,
                                            "city": "Douglasville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30332",
                                            "distance": 30.807,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30361",
                                            "distance": 30.602,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30168",
                                            "distance": 35.274,
                                            "city": "Austell",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30306",
                                            "distance": 29.767,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30325",
                                            "distance": 29.829,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31191",
                                            "distance": 29.829,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30357",
                                            "distance": 29.487,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30333",
                                            "distance": 30.181,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30363",
                                            "distance": 29.375,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30079",
                                            "distance": 31.711,
                                            "city": "Scottdale",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30072",
                                            "distance": 33.805,
                                            "city": "Pine Lake",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30318",
                                            "distance": 29.692,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30322",
                                            "distance": 29.668,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30083",
                                            "distance": 33.71,
                                            "city": "Stone Mountain",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30309",
                                            "distance": 28.38,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30039",
                                            "distance": 43.313,
                                            "city": "Snellville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30369",
                                            "distance": 29.3,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30086",
                                            "distance": 34.91,
                                            "city": "Stone Mountain",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30087",
                                            "distance": 36.864,
                                            "city": "Stone Mountain",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30021",
                                            "distance": 30.993,
                                            "city": "Clarkston",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30376",
                                            "distance": 27.499,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30033",
                                            "distance": 28.812,
                                            "city": "Decatur",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30126",
                                            "distance": 30.652,
                                            "city": "Mableton",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30052",
                                            "distance": 53.026,
                                            "city": "Loganville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30324",
                                            "distance": 26.478,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30111",
                                            "distance": 35.449,
                                            "city": "Clarkdale",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30347",
                                            "distance": 26.723,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30359",
                                            "distance": 26.937,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30329",
                                            "distance": 26.063,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30348",
                                            "distance": 25.043,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30355",
                                            "distance": 25.182,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30305",
                                            "distance": 24.395,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30106",
                                            "distance": 32.531,
                                            "city": "Austell",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30326",
                                            "distance": 22.982,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30301",
                                            "distance": 22.802,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30085",
                                            "distance": 27.681,
                                            "city": "Tucker",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30345",
                                            "distance": 24.655,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30084",
                                            "distance": 27.524,
                                            "city": "Tucker",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30082",
                                            "distance": 26.043,
                                            "city": "Smyrna",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30081",
                                            "distance": 24.343,
                                            "city": "Smyrna",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30141",
                                            "distance": 41.136,
                                            "city": "Hiram",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30078",
                                            "distance": 40.564,
                                            "city": "Snellville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30327",
                                            "distance": 20.759,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30080",
                                            "distance": 22.856,
                                            "city": "Smyrna",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30047",
                                            "distance": 32.736,
                                            "city": "Lilburn",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30127",
                                            "distance": 34.496,
                                            "city": "Powder Springs",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30319",
                                            "distance": 20.564,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30339",
                                            "distance": 20.975,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30366",
                                            "distance": 21.548,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30048",
                                            "distance": 30.891,
                                            "city": "Lilburn",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30342",
                                            "distance": 19.27,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30157",
                                            "distance": 48.255,
                                            "city": "Dallas",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30341",
                                            "distance": 20.724,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30384",
                                            "distance": 19.16,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30017",
                                            "distance": 43.551,
                                            "city": "Grayson",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30008",
                                            "distance": 25.388,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30340",
                                            "distance": 21.591,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30093",
                                            "distance": 25.527,
                                            "city": "Norcross",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30044",
                                            "distance": 33.406,
                                            "city": "Lawrenceville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30346",
                                            "distance": 15.302,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30060",
                                            "distance": 19.976,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30620",
                                            "distance": 59.914,
                                            "city": "Bethlehem",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30328",
                                            "distance": 13.634,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30360",
                                            "distance": 17.325,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30067",
                                            "distance": 14.965,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30045",
                                            "distance": 44.668,
                                            "city": "Lawrenceville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30356",
                                            "distance": 13.943,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30003",
                                            "distance": 21.706,
                                            "city": "Norcross",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30010",
                                            "distance": 21.706,
                                            "city": "Norcross",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30091",
                                            "distance": 21.706,
                                            "city": "Norcross",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30042",
                                            "distance": 39.075,
                                            "city": "Lawrenceville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30064",
                                            "distance": 23.908,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30071",
                                            "distance": 21.198,
                                            "city": "Norcross",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30338",
                                            "distance": 13.814,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30046",
                                            "distance": 38.268,
                                            "city": "Lawrenceville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30006",
                                            "distance": 18.071,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30007",
                                            "distance": 18.071,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30061",
                                            "distance": 18.071,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30063",
                                            "distance": 18.071,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30065",
                                            "distance": 18.071,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30069",
                                            "distance": 18.071,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30090",
                                            "distance": 18.071,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30068",
                                            "distance": 10.392,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30092",
                                            "distance": 17.233,
                                            "city": "Norcross",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30096",
                                            "distance": 24.322,
                                            "city": "Duluth",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30019",
                                            "distance": 47.511,
                                            "city": "Dacula",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30350",
                                            "distance": 9.999,
                                            "city": "Atlanta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30132",
                                            "distance": 43.817,
                                            "city": "Dallas",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30152",
                                            "distance": 24.662,
                                            "city": "Kennesaw",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30156",
                                            "distance": 24.991,
                                            "city": "Kennesaw",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30160",
                                            "distance": 24.991,
                                            "city": "Kennesaw",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30043",
                                            "distance": 35.657,
                                            "city": "Lawrenceville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30026",
                                            "distance": 23.006,
                                            "city": "North Metro",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30029",
                                            "distance": 23.006,
                                            "city": "North Metro",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30095",
                                            "distance": 23.006,
                                            "city": "Duluth",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30098",
                                            "distance": 23.006,
                                            "city": "Duluth",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30099",
                                            "distance": 23.006,
                                            "city": "Duluth",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30062",
                                            "distance": 9.089,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30011",
                                            "distance": 51.149,
                                            "city": "Auburn",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "31144",
                                            "distance": 20.593,
                                            "city": "Kennesaw",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30097",
                                            "distance": 22.771,
                                            "city": "Duluth",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30076",
                                            "distance": 7.862,
                                            "city": "Roswell",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30022",
                                            "distance": 14.164,
                                            "city": "Alpharetta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30077",
                                            "distance": 4.627,
                                            "city": "Roswell",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30066",
                                            "distance": 10.855,
                                            "city": "Marietta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30101",
                                            "distance": 29.282,
                                            "city": "Acworth",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30144",
                                            "distance": 18.587,
                                            "city": "Kennesaw",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30075",
                                            "distance": 0,
                                            "city": "Roswell",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30023",
                                            "distance": 11.098,
                                            "city": "Alpharetta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30024",
                                            "distance": 27.619,
                                            "city": "Suwanee",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30009",
                                            "distance": 8.304,
                                            "city": "Alpharetta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30519",
                                            "distance": 41.163,
                                            "city": "Buford",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30005",
                                            "distance": 16.379,
                                            "city": "Alpharetta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30548",
                                            "distance": 57.551,
                                            "city": "Hoschton",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30178",
                                            "distance": 53.645,
                                            "city": "Taylorsville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30515",
                                            "distance": 37.387,
                                            "city": "Buford",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30102",
                                            "distance": 23.045,
                                            "city": "Acworth",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30188",
                                            "distance": 9.802,
                                            "city": "Woodstock",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30189",
                                            "distance": 18.313,
                                            "city": "Woodstock",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30137",
                                            "distance": 35.04,
                                            "city": "Emerson",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30517",
                                            "distance": 55.245,
                                            "city": "Braselton",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30518",
                                            "distance": 34.496,
                                            "city": "Buford",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30169",
                                            "distance": 12.595,
                                            "city": "Canton",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30004",
                                            "distance": 13.553,
                                            "city": "Alpharetta",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30120",
                                            "distance": 44.327,
                                            "city": "Cartersville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30142",
                                            "distance": 15.734,
                                            "city": "Holly Springs",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30542",
                                            "distance": 46.369,
                                            "city": "Flowery Branch",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30502",
                                            "distance": 51.949,
                                            "city": "Chestnut Mountain",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30115",
                                            "distance": 16.598,
                                            "city": "Canton",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30041",
                                            "distance": 31.442,
                                            "city": "Cumming",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30121",
                                            "distance": 39.605,
                                            "city": "Cartersville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30146",
                                            "distance": 17.828,
                                            "city": "Lebanon",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30040",
                                            "distance": 25.428,
                                            "city": "Cumming",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30123",
                                            "distance": 45.734,
                                            "city": "Cassville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30566",
                                            "distance": 49.812,
                                            "city": "Oakwood",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30145",
                                            "distance": 58.738,
                                            "city": "Kingston",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30114",
                                            "distance": 24.735,
                                            "city": "Canton",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30184",
                                            "distance": 38.998,
                                            "city": "White",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30504",
                                            "distance": 51.913,
                                            "city": "Gainesville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30503",
                                            "distance": 57.791,
                                            "city": "Gainesville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30028",
                                            "distance": 33.001,
                                            "city": "Cumming",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30107",
                                            "distance": 31.538,
                                            "city": "Ball Ground",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30183",
                                            "distance": 37.088,
                                            "city": "Waleska",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30171",
                                            "distance": 44.511,
                                            "city": "Rydal",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30506",
                                            "distance": 55.91,
                                            "city": "Gainesville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30103",
                                            "distance": 59.562,
                                            "city": "Adairsville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30151",
                                            "distance": 36.18,
                                            "city": "Nelson",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30177",
                                            "distance": 39.632,
                                            "city": "Tate",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30534",
                                            "distance": 47.527,
                                            "city": "Dawsonville",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30139",
                                            "distance": 50.981,
                                            "city": "Fairmount",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30148",
                                            "distance": 46.495,
                                            "city": "Marble Hill",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30143",
                                            "distance": 45.183,
                                            "city": "Jasper",
                                            "state": "GA"
                                        },
                                        {
                                            "zip_code": "30175",
                                            "distance": 54.808,
                                            "city": "Talking Rock",
                                            "state": "GA"
                                        }
                                    ]
                                }
                                """


}
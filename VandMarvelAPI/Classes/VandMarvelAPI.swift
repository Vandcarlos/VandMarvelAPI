public final class VandMarvelAPI {

    private init() {}

    public static let shared = VandMarvelAPI()

    public var baseURL = ""
    public var auth = VMAuth(privateKey: "", publicKey: "")

}

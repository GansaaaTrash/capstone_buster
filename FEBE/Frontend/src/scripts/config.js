const CONFIG = {
  BASE_URL: "http://127.0.0.1:8000/api",

  ENDPOINTS: {
    REGISTER: "/register",
    LOGIN: "/login",
    CHECK_HOAX: "/predict", // tambahkan endpoint ini
  },

  CACHE_NAME: "HoaxBusterApp-V1",
};

export default CONFIG;


    -- Status fitur
status = {
    BYPASS = false,
    AIM_ASSIST_V2 = false,
    MAGIC_BULLET_LOBBY = false,
    MAGIC_BULLET_GAME_V2 = false,
    LESS_RECOIL = false,
    REDUCE_BULLET_SPREAD = false,
    EXPLOSION_DAMAGE_UP = false,
    NO_RECOIL_V2 = false,
    BODY_COLOR = false,
    SMOOTH_GRAPHICS = false,
    DAMAGE_BUFF_V2 = false,
    FPS_120 = false
}

function ToggleFeature(name, func)
    if status[name] then
        gg.toast(name .. " Deactivated 🔴")
        status[name] = false
    else
        func()
        gg.toast(name .. " Activated 🟢")
        status[name] = true
    end
end

-- Fungsi Bypass
function bp()
    local files_to_remove = {
        "/storage/emulated/0/Android/data/com.amy.virtual.pro/rootfs/storage/emulated/0/Android/data/com.netease.newspike/cache/mpay/336/559d7f9873b8d5083adbdc78902884f6",
        "/storage/emulated/0/Android/data/com.amy.virtual.pro/rootfs/storage/emulated/0/Android/data/com.netease.newspike/cache/mpay/336/b681de49286779259a7fdeffff3dd1ce",
        "/storage/emulated/0/Android/data/com.amy.virtual.pro/rootfs/storage/emulated/0/Android/data/com.netease.newspike/cache/mpay/336/c16e004e0e717314020faa28a2b8a86d",
        "/storage/emulated/0/Android/data/com.amy.virtual.pro/rootfs/storage/emulated/0/Android/data/com.netease.newspike/cache/mpay/336/cb8dc1bb335b17c3b438713ac67d94d0",
        "/storage/emulated/0/Android/data/com.netease.newspike/cache/netease_httpdns_config_file.txt",
        "/storage/emulated/0/netease/mpay/oversea/preference/a8510daaeaf882f26cc168803e6c4b25/mpay_oversea_sdk_336",
        "/storage/emulated/0/netease/newspike/logs/report.log",
        "/storage/emulated/0/netease/newspike/logs/anticheat.log",
        "/storage/emulated/0/netease/newspike/config/ban_status.txt",
        "/storage/emulated/0/netease/newspike/config/security_flags.json"
    }

    for _, file in ipairs(files_to_remove) do
        os.remove(file)
    end
end

function BYPASS()
    ToggleFeature("BYPASS", function()
        bp()
    end)
end

function MainMenu()
    local menu = gg.multiChoice({
        "➤ BYPASS " .. (status.BYPASS and "🟢" or "🔴"),
        "➤ AIM ASSIST V2 " .. (status.AIM_ASSIST_V2 and "🟢" or "🔴"),
        "➤ MAGIC BULLET LOBBY " .. (status.MAGIC_BULLET_LOBBY and "🟢" or "🔴"),
        "➤ MAGIC BULLET GAME V2 " .. (status.MAGIC_BULLET_GAME_V2 and "🟢" or "🔴"),
        "➤ LESS RECOIL " .. (status.LESS_RECOIL and "🟢" or "🔴"),
        "➤ REDUCE BULLET SPREAD " .. (status.REDUCE_BULLET_SPREAD and "🟢" or "🔴"),
        "➤ EXPLOSION DAMAGE UP " .. (status.EXPLOSION_DAMAGE_UP and "🟢" or "🔴"),
        "➤ NO RECOIL V2 " .. (status.NO_RECOIL_V2 and "🟢" or "🔴"),
        "➤ BODY COLOR " .. (status.BODY_COLOR and "🟢" or "🔴"),
        "➤ SMOOTH GRAPHICS " .. (status.SMOOTH_GRAPHICS and "🟢" or "🔴"),
        "➤ DAMAGE BUFF V2 " .. (status.DAMAGE_BUFF_V2 and "🟢" or "🔴"),
        "➤ 120 FPS " .. (status.FPS_120 and "🟢" or "🔴"),
        "❌ EXIT"
    }, nil, "🔥 BloodStrike Cheat Menu 🔥\nPilih beberapa fitur yang ingin diaktifkan!")

    if menu == nil then return end
    gg.setVisible(false)

    local actions = {
        BYPASS,
        AIM_ASSIST_V2,
        MAGIC_BULLET_LOBBY,
        MAGIC_BULLET_GAME_V2,
        LESS_RECOIL,
        REDUCE_BULLET_SPREAD,
        EXPLOSION_DAMAGE_UP,
        NO_RECOIL_V2,
        BODY_COLOR,
        SMOOTH_GRAPHICS,
        DAMAGE_BUFF_V2,
        FPS_120
    }

    -- Menjalankan semua fitur yang dipilih oleh pengguna
    for i, _ in pairs(menu) do
        if i <= #actions then
            actions[i]()
        elseif i == 12 then
            ResetScript()
        elseif i == 13 then
            gg.toast("Exiting...")
            os.exit()
        end
    end
end

-- Fungsi Cheat
function AIM_ASSIST_V2()
    ToggleFeature("AIM_ASSIST_V2", function()
        local LibStart = gg.getRangesList("libGame.so")[1].start
        gg.setValues({{address = LibStart + 23579504, value = "h2 95 C7 F3 F0 00 08 03 F2 73 80 3F", flags = 32}})
    end)
end

function MAGIC_BULLET_LOBBY()
    ToggleFeature("MAGIC_BULLET_LOBBY", function()
        io.open(gg.EXT_CACHE_DIR .. "/crack.txt", "w+"):write("\n13196\nVar #735A45C89C|735a45c89c|10|3f828f5c|0|0|0|0|rw-p|libGame.so:bss|1989c\n"):close()
        gg.loadList(gg.EXT_CACHE_DIR .. "/crack.txt", gg.LOAD_VALUES)
    end)
end

function MAGIC_BULLET_GAME_V2()
    ToggleFeature("MAGIC_BULLET_GAME_V2", function()
        io.open(gg.EXT_CACHE_DIR .. "/crack.txt", "w+"):write("\n13996\nVar #734BF1289C|734bf1289c|10|3f8147ae|0|0|0|0|rw-p|libGame.so:bss|1989c\n"):close()
        gg.loadList(gg.EXT_CACHE_DIR .. "/crack.txt", gg.LOAD_VALUES)
    end)
end

function LESS_RECOIL()
    ToggleFeature("LESS_RECOIL", function()
        io.open(gg.EXT_CACHE_DIR .. "/crack.txt", "w+"):write("\n18949\nVar #734BE83940|734be83940|10|d01502f9|0|0|0|0|r-xp|libGame.so|1680940\n"):close()
        gg.loadList(gg.EXT_CACHE_DIR .. "/crack.txt", gg.LOAD_VALUES)
    end)
end

function REDUCE_BULLET_SPREAD()
    ToggleFeature("REDUCE_BULLET_SPREAD", function()
        io.open(gg.EXT_CACHE_DIR .. "/crack.txt", "w+"):write("\n3064\nVar #7A1B74E36C|7a1b74e36c|10|100000|0|0|0|0|rw-p|libGame.so:bss|1436c\n"):close()
        gg.loadList(gg.EXT_CACHE_DIR .. "/crack.txt", gg.LOAD_VALUES)
    end)
end

function EXPLOSION_DAMAGE_UP()
    ToggleFeature("EXPLOSION_DAMAGE_UP", function()
        io.open(gg.EXT_CACHE_DIR .. "/crack.txt", "w+"):write("\n3064\nVar #7A1B74E36C|7a1b74e36c|10|1,99999|0|0|0|0|rw-p|libGame.so:bss|1436c\n"):close()
        gg.loadList(gg.EXT_CACHE_DIR .. "/crack.txt", gg.LOAD_VALUES)
    end)
end

function NO_RECOIL_V2()
    ToggleFeature("NO_RECOIL_V2", function()
        local so = gg.getRangesList("libGame.so")[1].start
        gg.setValues({{address = so + 23777324, value = 1076101120, flags = 32}})
    end)
end

function BODY_COLOR()
    ToggleFeature("BODY_COLOR", function()
        local LibStart = gg.getRangesList("libGame.so")[1].start
        gg.setValues({{address = LibStart + 23786248, value = "0,17700000107", flags = 32}})
    end)
end

function SMOOTH_GRAPHICS()
    ToggleFeature("SMOOTH_GRAPHICS", function()
        local LibStart = gg.getRangesList("libGame.so")[1].start
        gg.setValues({{address = LibStart + 23572216, value = "h CD CC CC 3E", flags = 32}})
    end)
end

function DAMAGE_BUFF_V2()
    ToggleFeature("DAMAGE_BUFF_V2", function()
        local LibStart = gg.getRangesList("libGame.so")[1].start
        gg.setValues({{address = LibStart + 498398704900, value = "hE17A843F", flags = 4}})
    end)
end

function FPS_120()
    ToggleFeature("FPS_120", function()
        local LibStart = gg.getRangesList("libGame.so")[1].start
        gg.setValues({{address = LibStart + 3019637864, value = 100100004673, flags = 16}})
    end)
end

-- Loop utama agar menu tetap aktif
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        MainMenu()
    end
    gg.sleep(100)
end

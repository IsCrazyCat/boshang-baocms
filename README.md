# boshang-baocms
博商baocms模板系统

1.域名修改在bao_setting表中 k=site的字段
2.图片上传地址将bao_uploadset表中status为1的para字段中的domain改为自己的图片服务器地址，没有该服务器的话将status都改为0，图片将默认上传到当前项目的attachs目录下
3.bao_city表中的domain字段均改为0，这里是设置不同的城市是否对应不同的二级域名，一般用不到。
    比如 域名为www.baocms.com在山东的访问地址就是bao_city表中 山东对应数据的 pinyin字段+baocms.com （sd.baocms.com）
    其中初始的城市设置是在 bao_setting表中，k为site的v中设置 city_id对应的值就是初始城市。

        
<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhjs=(String) session.getAttribute("yhjs");
String dwbh=(String) session.getAttribute("dwbh");
%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center"> 
                <p>
                  <input type="button"  value="�״����ѻ�Ա��ѯ" onClick="f_do(selectform,'sccx')">
                  <input type="button"  value="������ѻ�Ա��ѯ" onClick="f_do(selectform,'dccx')" name="button">
                  <input type="button"  value="ȫ����Ա��ѯ" onClick="f_do(selectform,'qbcx')" name="button2">
                </p>
                <p> 
                  <input type="button"  value="�״����ѻ�Աͳ��" onClick="f_do(selectform,'sctj')" name="button3">
                  <input type="button"  value="������ѻ�Աͳ��" onClick="f_do(selectform,'dctj')" name="button32">
                  <input type="button"  value="ȫ����Աͳ��" onClick="f_do(selectform,'qbtj')" name="button33">
                </p>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right" bgcolor="#CCFFFF">ͳ��</td>
              <td colspan="3"> ��һ�� 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                   <option value="zymc">ְҵ</option>
                  <option value="hy_ysrdmb.ysrdm">������</option>
                  <option value="decode(hy_hyxxb.nlfw,'1','25������','2','25-35��','3','35-45��','4','45-55��','5','55������','6','δ��д')">�����</option>
                  <option value="hy_gmyydmb.gmyy">����ԭ��</option>
				  <option value="decode(dm_gmyj.gmyjbm,'00','����������ȫ','01','����Ʒ�ʺ�','02','��ʽʱ�и߹�','03','�۸����','04','�����','05','���ﻷ����','06','δ��д','07','����',dm_gmyj.gmyjbm)">��ؿ�������</option>
                  <option value="DECODE(hy_hyxxb.xb,'M','��','W','Ů')">�Ա�</option>
                  <option value="hy_hyjbb.hyjb">��Ա����</option>

				  <option value="DECODE(hy_hyxxb.hyzk,'Y','�ѻ�','N','δ��')">����״��</option>

				  <option value="sq_dwxx.dwmc">����ר����</option>
				  <option value="DECODE(hy_hyxxb.sfzf,'Y','��','N','��')">�Ƿ�����</option>
				  <option value="hy_hyxxb.gmcs">�������</option>


				  <option value="HY_XXQD.xmmc">��ȡ��Ϣ������</option>
				  <option value="HY_VIP.xmmc">VIP����</option>
				  <option value="HY_SHFW.xmmc">�ۺ������</option>
				  <option value="HY_CXHD.xmmc">�Ƿ�Ը��μӻ</option>
                  <option value="hy_gjjy.xmmc">�Ľ�����</option>

                </select>
                �ڶ��� 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                   <option value="zymc">ְҵ</option>
                  <option value="hy_ysrdmb.ysrdm">������</option>
                  <option value="decode(hy_hyxxb.nlfw,'1','25������','2','25-35��','3','35-45��','4','45-55��','5','55������','6','δ��д')">�����</option>
                  <option value="hy_gmyydmb.gmyy">����ԭ��</option>
				  <option value="decode(dm_gmyj.gmyjbm,'00','����������ȫ','01','����Ʒ�ʺ�','02','��ʽʱ�и߹�','03','�۸����','04','�����','05','���ﻷ����','06','δ��д','07','����',dm_gmyj.gmyjbm)">��ؿ�������</option>
                  <option value="DECODE(hy_hyxxb.xb,'M','��','W','Ů')">�Ա�</option>
                  <option value="hy_hyjbb.hyjb">��Ա����</option>

				  <option value="DECODE(hy_hyxxb.hyzk,'Y','�ѻ�','N','δ��')">����״��</option>

				  <option value="sq_dwxx.dwmc">����ר����</option>
				  <option value="DECODE(hy_hyxxb.sfzf,'Y','��','N','��')">�Ƿ�����</option>
				  <option value="hy_hyxxb.gmcs">�������</option>


				  <option value="HY_XXQD.xmmc">��ȡ��Ϣ������</option>
				  <option value="HY_VIP.xmmc">VIP����</option>
				  <option value="HY_SHFW.xmmc">�ۺ������</option>
				  <option value="HY_CXHD.xmmc">�Ƿ�Ը��μӻ</option>
                  <option value="hy_gjjy.xmmc">�Ľ�����</option>

                </select>
                ������ 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                   <option value="zymc">ְҵ</option>
                  <option value="hy_ysrdmb.ysrdm">������</option>
                  <option value="decode(hy_hyxxb.nlfw,'1','25������','2','25-35��','3','35-45��','4','45-55��','5','55������','6','δ��д')">�����</option>
                  <option value="hy_gmyydmb.gmyy">����ԭ��</option>
				  <option value="decode(dm_gmyj.gmyjbm,'00','����������ȫ','01','����Ʒ�ʺ�','02','��ʽʱ�и߹�','03','�۸����','04','�����','05','���ﻷ����','06','δ��д','07','����',dm_gmyj.gmyjbm)">��ؿ�������</option>
                  <option value="DECODE(hy_hyxxb.xb,'M','��','W','Ů')">�Ա�</option>
                  <option value="hy_hyjbb.hyjb">��Ա����</option>

				  <option value="DECODE(hy_hyxxb.hyzk,'Y','�ѻ�','N','δ��')">����״��</option>

				  <option value="sq_dwxx.dwmc">����ר����</option>
				  <option value="DECODE(hy_hyxxb.sfzf,'Y','��','N','��')">�Ƿ�����</option>
				  <option value="hy_hyxxb.gmcs">�������</option>


				  <option value="HY_XXQD.xmmc">��ȡ��Ϣ������</option>
				  <option value="HY_VIP.xmmc">VIP����</option>
				  <option value="HY_SHFW.xmmc">�ۺ������</option>
				  <option value="HY_CXHD.xmmc">�Ƿ�Ը��μӻ</option>
                  <option value="hy_gjjy.xmmc">�Ľ�����</option>

                </select>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right" bgcolor="#CCFFFF">��ѯ�������</td>
              <td colspan="3"> 
                <select name="pxzd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="hy_hyxxb.hykh">ˮ�ʷ�������</option>
                  <option value="hy_hyxxb.hybh">��Ա���</option>
                  <option value="hy_hyxxb.hyxm">��Ա����</option>
                  <option value="hy_hyxxb.rhrq">�������</option>

                  <option value="hy_hyjbb.hyjb">��Ա����</option>
				  <option value="xb">�Ա�</option>
				  <option value="hy_hyxxb.Csrq">��������</option>
				  <option value="hyzk">����״��</option>
				  <option value="hy_hyxxb.Hydz">��Ա��ַ</option>

				  <option value="hy_hyxxb.Yzbm">��������</option>
				  <option value="hy_hyxxb.Dzxx">��������</option>
				  <option value="hy_hyxxb.Dh">�绰</option>
				  <option value="hy_hyxxb.Sj">�ֻ�</option>
				  <option value="hy_hyxxb.zydm">ְҵ</option>
				  <option value="hy_hyxxb.ysrdm">������</option>
				  <option value="hy_hyxxb.dwbh">����ר����</option>
				  <option value="sfzf">�Ƿ�����</option>
				  <option value="hy_hyxxb.fwlx">��������</option>
				  <option value="hy_hyxxb.gmcs">�������</option>
				  <option value="hy_hyxxb.xfzje">�����ܽ��</option>
				  <option value="hy_hyxxb.jf">����</option>
				  <option value="hy_hyxxb.wdhjf">δ�һ�����</option>
                </select>
                ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">������� ��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_rhrq" size="20" maxlength="10" value="" onKeyUp="keyGo(hy_hyxxb_rhrq2)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_rhrq2" size="20" maxlength="10" value="" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">�������� ��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxfjlb_gmrq" size="20" maxlength="10"  value=""onKeyUp="keyGo(hy_hyxfjlb_gmrq2)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxfjlb_gmrq2" size="20" maxlength="10" value="" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��Ա����</td>
              <td width="33%"> 
                <select name="hy_hyxxb_hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
                </select>
              </td>
              <td width="17%" align="right">����ר����</td>
              <td width="33%"> 
                <select name="hy_hyxxb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("00"))//00���ܹ�˾
	{
		out.println("<option value=''></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx not in('5','6') order by dwbh","");
	}
	else if (yhjs.equals("02"))//02���ֹ�˾
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('2','3') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("01"))//01��ר����
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"' ","");
	}
	else if (yhjs.equals("03"))//03��������
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('4','8') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("04"))//04������ר����
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right">ְҵ</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_zydm" style="FONT-SIZE:12PX;WIDTH:152PX" size="6" multiple>
                  <option value=""></option>
                  <%	
				  cf.selectItem(out," select xh,zymc from hy_zydmb order by xh","");
				  %> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">������</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_ysrdm" style="FONT-SIZE:12PX;WIDTH:152PX" size="6" multiple>
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,ysrdm from hy_ysrdmb order by xh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">����ԭ��</td>
              <td width="33%"> 
                <select name="hy_hyxfjlb_gmyy" style="FONT-SIZE:12PX;WIDTH:152PX" size="6" multiple>
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,gmyy from hy_gmyydmb order by xh","");
%> 
                </select>
              </td>
              <td width="17%" align="right">��ؿ�������</td>
              <td width="33%"> 
                <select name="hy_hyxfjlb_gmyjbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="6" multiple>
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gmyjbm,gmyjmc from hy_gmyjbm order by gmyjbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">��ͥ����</div>
              </td>
              <td width="33%"> 
                <select name="jtsr" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='��ͥ����'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">���䷶Χ</div>
              </td>
              <td width="33%"> 
                <select name="nlfw" style="FONT-SIZE:12PX;WIDTH:152PX" multiple size="4">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='�����'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%"> 
                <div align="right">�´ο��������ʯ��Ʒ</div>
              </td>
              <td width="33%"> 
                <select name="xcgm" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select pmbm,pmmc from xt_pmbm order by pmbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">��ӵ�е���ʯ��Ʒ</div>
              </td>
              <td width="33%"> 
                <select name="xysp" style="FONT-SIZE:12PX;WIDTH:152PX" multiple size="4">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select pmbm,pmmc from xt_pmbm order by pmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">Ϊ˭��������</div>
              </td>
              <td width="33%"> 
                <select name="gmmd" style="FONT-SIZE:12PX;WIDTH:152PX" multiple size="4">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='Ϊ˭����'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">��ȡ��Ϣ������</div>
              </td>
              <td width="33%"> 
                <select name="xxqd" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='��Ϣ����'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%"> 
                <div align="right">VIP����</div>
              </td>
              <td width="33%"> 
                <select name="vipfl" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='VIP'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">�ۺ������</div>
              </td>
              <td width="33%"> 
                <select name="shfwjy" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='�ۺ����'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">�Ƿ�Ը��μӻ</div>
              </td>
              <td width="33%"> 
                <select name="cjhd" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='�����'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">�Ľ�����</div>
              </td>
              <td width="33%"> 
                <select name="gjjy" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <%
	cf.selectItem(out,"select trim(sxbh),sxmc from xt_gydmb where dmmc='�Ľ�����'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">�������� ��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_csrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_csrq2" size="20" maxlength="10" >
              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
            <td width="20%"> <div align="right">�������� ��</div></td>
            <td width="31%"> <select  name="yf" >
			   <option value="00"></option>
                <option value="01">1��</option>
                <option value="02">2��</option>
                <option value="03">3��</option>
                <option value="04">4��</option>
                <option value="05">5��</option>
                <option value="06">6��</option>
                <option value="07">7��</option>
                <option value="08">8��</option>
                <option value="09">9��</option>
                <option value="10">10��</option>
                <option value="11">11��</option>
                <option value="12">12��</option>
              </select> <select name="rq" style="FONT-SIZE:14px;WIDTH:60px" >
			  	<option value="00"></option>
                <option value="01">1��</option>
                <option value="02">2��</option>
                <option value="03">3��</option>
                <option value="04">4��</option>
                <option value="05">5��</option>
                <option value="06">6��</option>
                <option value="07">7��</option>
                <option value="08">8��</option>
                <option value="09">9��</option>
                <option value="10">10��</option>
                <option value="11">11��</option>
                <option value="12">12��</option>
                <option value="13">13��</option>
                <option value="14">14��</option>
                <option value="15">15��</option>
                <option value="16">16��</option>
                <option value="17">17��</option>
                <option value="18">18��</option>
                <option value="19">19��</option>
                <option value="20">20��</option>
                <option value="21">21��</option>
                <option value="22">22��</option>
                <option value="23">23��</option>
                <option value="24">24��</option>
                <option value="25">25��</option>
                <option value="26">26��</option>
                <option value="27">27��</option>
                <option value="28">28��</option>
                <option value="29">29��</option>
                <option value="30">30��</option>
                <option value="31">31��</option>
              </select> </td>
            <td width="20%"> <div align="right">��</div></td>
            <td width="29%"> <select  name="yf2" >
				<option value="00"></option>
                <option value="01">1��</option>
                <option value="02">2��</option>
                <option value="03">3��</option>
                <option value="04">4��</option>
                <option value="05">5��</option>
                <option value="06">6��</option>
                <option value="07">7��</option>
                <option value="08">8��</option>
                <option value="09">9��</option>
                <option value="10">10��</option>
                <option value="11">11��</option>
                <option value="12">12��</option>
              </select> <select name="rq2" style="FONT-SIZE:14px;WIDTH:60px" >
			  <option value="00"></option>
                <option value="01">1��</option>
                <option value="02">2��</option>
                <option value="03">3��</option>
                <option value="04">4��</option>
                <option value="05">5��</option>
                <option value="06">6��</option>
                <option value="07">7��</option>
                <option value="08">8��</option>
                <option value="09">9��</option>
                <option value="10">10��</option>
                <option value="11">11��</option>
                <option value="12">12��</option>
                <option value="13">13��</option>
                <option value="14">14��</option>
                <option value="15">15��</option>
                <option value="16">16��</option>
                <option value="17">17��</option>
                <option value="18">18��</option>
                <option value="19">19��</option>
                <option value="20">20��</option>
                <option value="21">21��</option>
                <option value="22">22��</option>
                <option value="23">23��</option>
                <option value="24">24��</option>
                <option value="25">25��</option>
                <option value="26">26��</option>
                <option value="27">27��</option>
                <option value="28">28��</option>
                <option value="29">29��</option>
                <option value="30">30��</option>
                <option value="31">31��</option>
              </select> </td>
          </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">�������� ��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_jhjnr" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_jhjnr2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">�������� ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_arsr" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_arsr2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right">������� ��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_gmcs" size="20" maxlength="8" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_gmcs2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right">�����ܽ�� ��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_xfzje" size="20" maxlength="17" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_xfzje2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%"> 
                <div align="right">���� ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_jf" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_jf2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right">δ�һ����� ��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_wdhjf" size="20" maxlength="8" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_wdhjf2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��Ա���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_hybh" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">�Ƿ�����</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_sfzf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+����&N+δ����","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <div align="right">ˮ�ʷ�������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_hykh" size="20" maxlength="11" >
              </td>
              <td width="17%" align="right"> 
                <div align="right">��������</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_fwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+��������&2+��ֵ����","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_hymm" size="20" maxlength="12" >
              </td>
              <td width="17%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_hyxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "hy_hyxxb_xb","M+��&W+Ů","");
%> </td>
              <td width="17%"> 
                <div align="right">��������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_yzbm" size="20" maxlength="12" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��Ա��ַ</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="hy_hyxxb_hydz" size="57" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�绰</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_dh" size="20" maxlength="50" >
              </td>
              <td width="17%"> 
                <div align="right">�ֻ�</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_sj" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_dzxx" size="20" maxlength="40" >
              </td>
              <td width="17%"> 
                <div align="right">���֤����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_sfzhm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" height="28"> 
                <div align="right">����״��</div>
              </td>
              <td width="33%" height="28"> <%
	cf.radioToken(out, "hy_hyxxb_hyzk","Y+�ѻ�&N+δ��","");
%> </td>
              <td width="17%" height="28"> 
                <div align="right">��������</div>
              </td>
              <td width="33%" height="28"> 
                <input type="text" name="hy_hyxxb_arxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�۸�ӡ��</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_jgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jgyxbm,jgyxmc from hy_jgyxbm order by jgyxbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">����ӡ��</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_fwyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwyxbm,fwyxmc from hy_fwyxbm order by fwyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">���ӡ��</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_fgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgyxbm,fgyxmc from hy_fgyxbm order by fgyxbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">����ӡ��</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_gyyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gyyxbm,gyyxmc from hy_gyyxbm order by gyyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ר����</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_zdfgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zdfgbm,zdfgmc from hy_zdfgbm order by zdfgbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">ƽʱ����</div>
              </td>
              <td width="33%"> 
                <select name="hy_hyxxb_psahbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select psahbm,psahmc  from hy_psahbm order by psahbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ϲ����ֽ��־</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_bzzz" size="20" value="">
              </td>
              <td width="17%"> 
                <div align="right">��֪ͬ��Ʒ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_sztlpp" size="20" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ϲ��ȥ���̵�</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_shop" size="20" value="">
              </td>
              <td width="17%"> 
                <div align="right">ϲ����ױƷƷ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_hzppp" size="20" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ϲ����װƷ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_fzpp" size="20" value="">
              </td>
              <td width="17%"> 
                <div align="right">��Ϣ¼����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_hyxxb_xxlrr" size="20" maxlength="16" >
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.hy_hyxxb_rhrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_rhrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxfjlb_gmrq, "�������� "))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxfjlb_gmrq2, "�������� "))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_csrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_csrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_jhjnr, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_jhjnr2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_arsr, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxxb_arsr2, "��������"))) {
		return false;
	}
//	if(!(isDatetime(FormName.hy_hyxxb_yxrq, "��Ч����"))) {
//		return false;
//	}
//	if(!(isDatetime(FormName.hy_hyxxb_yxrq2, "��Ч����"))) {
//		return false;
//	}
	if(!(isNumber(FormName.hy_hyxxb_gmcs, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_gmcs2, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.hy_hyxxb_xfzje, "�����ܽ��"))) {
		return false;
	}
	if(!(isFloat(FormName.hy_hyxxb_xfzje2, "�����ܽ��"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_jf, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_jf2, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_wdhjf, "δ�һ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.hy_hyxxb_wdhjf2, "δ�һ�����"))) {
		return false;
	}

	

	if (lx=="sccx")
	{
		if(	javaTrim(FormName.hy_hyxxb_rhrq)=="") {
			alert("������[�������]��");
			FormName.hy_hyxxb_rhrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxxb_rhrq, "�������"))) {
			return false;
		}
		if(	javaTrim(FormName.hy_hyxxb_rhrq2)=="") {
			alert("������[�������]��");
			FormName.hy_hyxxb_rhrq2.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxxb_rhrq2, "�������"))) {
			return false;
		}
		FormName.action="Hy_hyxxbScCxList.jsp";
	}
	else if (lx=="dccx")
	{
		if(	javaTrim(FormName.hy_hyxfjlb_gmrq)=="") {
			alert("������[��������]��");
			FormName.hy_hyxfjlb_gmrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxfjlb_gmrq, "�������� "))) {
			return false;
		}
		if(	javaTrim(FormName.hy_hyxfjlb_gmrq2)=="") {
			alert("������[��������]��");
			FormName.hy_hyxfjlb_gmrq2.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxfjlb_gmrq2, "�������� "))) {
			return false;
		}
		FormName.action="Hy_hyxxbDcCxList.jsp";
	}
	else if (lx=="qbcx")
	{
		if(!(isInt(FormName.myxssl, "ÿҳ��ʾ����"))) {
				return false;
		}
		FormName.action="Hy_hyxxbCxList.jsp";
	}
	else if (lx=="sctj")
	{
		if(	javaTrim(FormName.hy_hyxxb_rhrq)=="") {
			alert("������[�������]��");
			FormName.hy_hyxxb_rhrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxxb_rhrq, "�������"))) {
			return false;
		}
		if(	javaTrim(FormName.hy_hyxxb_rhrq2)=="") {
			alert("������[�������]��");
			FormName.hy_hyxxb_rhrq2.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxxb_rhrq2, "�������"))) {
			return false;
		}
		FormName.action="sctj.jsp";
	}
	else if (lx=="dctj")
	{
		if(	javaTrim(FormName.hy_hyxfjlb_gmrq)=="") {
			alert("������[��������]��");
			FormName.hy_hyxfjlb_gmrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxfjlb_gmrq, "�������� "))) {
			return false;
		}
		if(	javaTrim(FormName.hy_hyxfjlb_gmrq2)=="") {
			alert("������[��������]��");
			FormName.hy_hyxfjlb_gmrq2.focus();
			return false;
		}
		if(!(isDatetime(FormName.hy_hyxfjlb_gmrq2, "�������� "))) {
			return false;
		}
		FormName.action="dctj.jsp";
	}
	else if (lx=="qbtj")
	{
		FormName.action="qbtj.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

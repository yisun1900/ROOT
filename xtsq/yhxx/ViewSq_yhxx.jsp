<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sq_yhxx_ygbh=null;
String sq_yhxx_yhmc=null;
String sq_yhxx_yhdlm=null;
String sq_yhxx_yhkl=null;
String sq_yhxx_yhjs=null;
String sq_dwxx_dwmc=null;
String sq_yhxx_sjsbh=null;
String sq_yhxx_xb=null;
String sq_yhxx_csrq=null;
String sq_yhxx_hf=null;
String sq_yhxx_mz=null;
String sq_yhxx_sfzh=null;
String sq_yhxx_hjszd=null;
String sq_yhxx_dacfd=null;
String sq_yhxx_byyx=null;
String sq_yhxx_zy=null;
String sq_yhxx_dh=null;
String sq_yhxx_email=null;
String sq_yhxx_zz=null;
String dm_zwbm_zwmc=null;
String sq_yhxx_sfzszg=null;
String sq_yhxx_rzsj=null;
String sq_yhxx_htksrq=null;
String sq_yhxx_htdqrq=null;
String sq_yhxx_lzyy=null;
String sq_yhxx_lzrq=null;
String sq_yhxx_sfqs=null;
//String sq_yhxx_ylbx=null;
//String sq_yhxx_jylbx=null;
//String sq_yhxx_sybx=null;
//String sq_yhxx_shbxh=null;
//String sq_yhxx_jbxdd=null;
String sq_yhxx_zkl=null;
String sq_yhxx_ckjgbz=null;
String sq_yhxx_zdyhbz=null;
String sq_yhxx_kdlxtbz=null;
String sq_yhxx_bjjb=null;
//String sq_yhxx_glgz=null;
//String sq_yhxx_gwgz=null;
//String sq_yhxx_jbgz=null;
String sq_yhxx_sjsjb=null;
//String sq_yhxx_yjsxe=null;
//String sq_yhxx_jtbt=null;
//String sq_yhxx_cb=null;
//String sq_yhxx_dhbt=null;
String sq_yhxx_sfydbs=null;
String sq_yhxx_sfytj=null;
String sq_yhxx_tjrq=null;
String sq_yhxx_bz=null;
String bianhao=null;
String xlbm=null;
String xzzwbm=null;

//String gsby=null;
String jjlxr=null;
String lxrdh=null;
String cjgzsj=null;
//String syx=null;
String ssfgs=null;
String yhdlm=null;
String kfgssq=null;
String sqdwmc="";

String wheresq_yhxx_ygbh=null;
wheresq_yhxx_ygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();//sq_yhxx.dhbt as sq_yhxx_dhbt,sq_yhxx.cb as sq_yhxx_cb,sq_yhxx.jtbt as sq_yhxx_jtbt,sq_yhxx.yjsxe as sq_yhxx_yjsxe,sq_yhxx.jbgz as sq_yhxx_jbgz,sq_yhxx.gwgz as sq_yhxx_gwgz,sq_yhxx.glgz as sq_yhxx_glgz,sq_yhxx.jbxdd as sq_yhxx_jbxdd,sq_yhxx.shbxh as sq_yhxx_shbxh,sq_yhxx.sybx as sq_yhxx_sybx,sq_yhxx.jylbx as sq_yhxx_jylbx,sq_yhxx.ylbx as sq_yhxx_ylbx,gsby,syx,
	ls_sql="select yhdlm,kfgssq,sq_yhxx.ssfgs,cjgzsj,lxrdh,jjlxr,xlbm,bianhao,sq_yhxx.ygbh as sq_yhxx_ygbh,sq_yhxx.yhmc as sq_yhxx_yhmc,sq_yhxx.yhdlm as sq_yhxx_yhdlm,sq_yhxx.yhkl as sq_yhxx_yhkl,sq_yhxx.yhjs as sq_yhxx_yhjs,sq_dwxx.dwmc as sq_dwxx_dwmc,sq_yhxx.sjsbh as sq_yhxx_sjsbh,sq_yhxx.xb as sq_yhxx_xb,sq_yhxx.csrq as sq_yhxx_csrq,sq_yhxx.hf as sq_yhxx_hf,sq_yhxx.mz as sq_yhxx_mz,sq_yhxx.sfzh as sq_yhxx_sfzh,sq_yhxx.hjszd as sq_yhxx_hjszd,sq_yhxx.dacfd as sq_yhxx_dacfd,sq_yhxx.byyx as sq_yhxx_byyx,sq_yhxx.zy as sq_yhxx_zy,sq_yhxx.dh as sq_yhxx_dh,sq_yhxx.email as sq_yhxx_email,sq_yhxx.zz as sq_yhxx_zz,dm_zwbm.zwmc as dm_zwbm_zwmc,sq_yhxx.sfzszg as sq_yhxx_sfzszg,sq_yhxx.rzsj as sq_yhxx_rzsj,sq_yhxx.htksrq as sq_yhxx_htksrq,sq_yhxx.htdqrq as sq_yhxx_htdqrq,sq_yhxx.lzyy as sq_yhxx_lzyy,sq_yhxx.lzrq as sq_yhxx_lzrq,sq_yhxx.sfqs as sq_yhxx_sfqs,sq_yhxx.zkl as sq_yhxx_zkl,sq_yhxx.ckjgbz as sq_yhxx_ckjgbz,sq_yhxx.zdyhbz as sq_yhxx_zdyhbz,sq_yhxx.kdlxtbz as sq_yhxx_kdlxtbz,sq_yhxx.bjjb as sq_yhxx_bjjb,sq_yhxx.sjsjb as sq_yhxx_sjsjb,sq_yhxx.sfydbs as sq_yhxx_sfydbs,sq_yhxx.sfytj as sq_yhxx_sfytj,sq_yhxx.tjrq as sq_yhxx_tjrq,sq_yhxx.bz as sq_yhxx_bz,xzzwbm ";
	ls_sql+=" from  dm_zwbm,sq_dwxx,sq_yhxx";
	ls_sql+=" where sq_yhxx.zwbm=dm_zwbm.zwbm(+) and sq_yhxx.dwbh=sq_dwxx.dwbh and  (sq_yhxx.ygbh='"+wheresq_yhxx_ygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		kfgssq=cf.fillNull(rs.getString("kfgssq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		//syx=cf.fillNull(rs.getString("syx"));
		cjgzsj=cf.fillNull(rs.getDate("cjgzsj"));
		lxrdh=cf.fillNull(rs.getString("lxrdh"));
		//gsby=cf.fillNull(rs.getString("gsby"));
		jjlxr=cf.fillNull(rs.getString("jjlxr"));

		xlbm=cf.fillNull(rs.getString("xlbm"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sq_yhxx_ygbh=cf.fillNull(rs.getString("sq_yhxx_ygbh"));
		sq_yhxx_yhmc=cf.fillNull(rs.getString("sq_yhxx_yhmc"));
		sq_yhxx_yhdlm=cf.fillNull(rs.getString("sq_yhxx_yhdlm"));
		sq_yhxx_yhkl=cf.fillNull(rs.getString("sq_yhxx_yhkl"));
		sq_yhxx_yhjs=cf.fillNull(rs.getString("sq_yhxx_yhjs"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		sq_yhxx_sjsbh=cf.fillNull(rs.getString("sq_yhxx_sjsbh"));
		sq_yhxx_xb=cf.fillNull(rs.getString("sq_yhxx_xb"));
		sq_yhxx_csrq=cf.fillNull(rs.getDate("sq_yhxx_csrq"));
		sq_yhxx_hf=cf.fillNull(rs.getString("sq_yhxx_hf"));
		sq_yhxx_mz=cf.fillNull(rs.getString("sq_yhxx_mz"));
		sq_yhxx_sfzh=cf.fillNull(rs.getString("sq_yhxx_sfzh"));
		sq_yhxx_hjszd=cf.fillNull(rs.getString("sq_yhxx_hjszd"));
		sq_yhxx_dacfd=cf.fillNull(rs.getString("sq_yhxx_dacfd"));
		sq_yhxx_byyx=cf.fillNull(rs.getString("sq_yhxx_byyx"));
		sq_yhxx_zy=cf.fillNull(rs.getString("sq_yhxx_zy"));
		sq_yhxx_dh=cf.fillNull(rs.getString("sq_yhxx_dh"));
		sq_yhxx_email=cf.fillNull(rs.getString("sq_yhxx_email"));
		sq_yhxx_zz=cf.fillNull(rs.getString("sq_yhxx_zz"));
		dm_zwbm_zwmc=cf.fillNull(rs.getString("dm_zwbm_zwmc"));
		sq_yhxx_sfzszg=cf.fillNull(rs.getString("sq_yhxx_sfzszg"));
		sq_yhxx_rzsj=cf.fillNull(rs.getDate("sq_yhxx_rzsj"));
		sq_yhxx_htksrq=cf.fillNull(rs.getDate("sq_yhxx_htksrq"));
		sq_yhxx_htdqrq=cf.fillNull(rs.getDate("sq_yhxx_htdqrq"));
		sq_yhxx_lzyy=cf.fillNull(rs.getString("sq_yhxx_lzyy"));
		sq_yhxx_lzrq=cf.fillNull(rs.getDate("sq_yhxx_lzrq"));
		sq_yhxx_sfqs=cf.fillNull(rs.getString("sq_yhxx_sfqs"));
		//sq_yhxx_ylbx=cf.fillNull(rs.getString("sq_yhxx_ylbx"));
		//sq_yhxx_jylbx=cf.fillNull(rs.getString("sq_yhxx_jylbx"));
		//sq_yhxx_sybx=cf.fillNull(rs.getString("sq_yhxx_sybx"));
		//sq_yhxx_shbxh=cf.fillNull(rs.getString("sq_yhxx_shbxh"));
		//sq_yhxx_jbxdd=cf.fillNull(rs.getString("sq_yhxx_jbxdd"));
		sq_yhxx_zkl=cf.fillNull(rs.getString("sq_yhxx_zkl"));
		sq_yhxx_ckjgbz=cf.fillNull(rs.getString("sq_yhxx_ckjgbz"));
		sq_yhxx_zdyhbz=cf.fillNull(rs.getString("sq_yhxx_zdyhbz"));
		sq_yhxx_kdlxtbz=cf.fillNull(rs.getString("sq_yhxx_kdlxtbz"));
		sq_yhxx_bjjb=cf.fillNull(rs.getString("sq_yhxx_bjjb"));
		//sq_yhxx_glgz=cf.fillNull(rs.getString("sq_yhxx_glgz"));
		//sq_yhxx_gwgz=cf.fillNull(rs.getString("sq_yhxx_gwgz"));
		//sq_yhxx_jbgz=cf.fillNull(rs.getString("sq_yhxx_jbgz"));
		sq_yhxx_sjsjb=cf.fillNull(rs.getString("sq_yhxx_sjsjb"));
		//sq_yhxx_yjsxe=cf.fillNull(rs.getString("sq_yhxx_yjsxe"));
		//sq_yhxx_jtbt=cf.fillNull(rs.getString("sq_yhxx_jtbt"));
		//sq_yhxx_cb=cf.fillNull(rs.getString("sq_yhxx_cb"));
		//sq_yhxx_dhbt=cf.fillNull(rs.getString("sq_yhxx_dhbt"));
		sq_yhxx_sfydbs=cf.fillNull(rs.getString("sq_yhxx_sfydbs"));
		sq_yhxx_sfytj=cf.fillNull(rs.getString("sq_yhxx_sfytj"));
		sq_yhxx_tjrq=cf.fillNull(rs.getDate("sq_yhxx_tjrq"));
		sq_yhxx_bz=cf.fillNull(rs.getString("sq_yhxx_bz"));
	}
	rs.close();
	ps.close();

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql="select dwmc";
		ls_sql+=" from  sq_sqfgs,sq_dwxx";
		ls_sql+=" where sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_sqfgs.ygbh='"+wheresq_yhxx_ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			sqdwmc+=rs.getString("dwmc")+"��";
		}
		rs.close();
		ps.close();
	}
	if (kfgssq.equals("3") || kfgssq.equals("4") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql="select dwmc";
		ls_sql+=" from  sq_sqbm,sq_dwxx";
		ls_sql+=" where sq_sqbm.dwbh=sq_dwxx.dwbh and sq_sqbm.ygbh='"+wheresq_yhxx_ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			sqdwmc+=rs.getString("dwmc")+"��";
		}
		rs.close();
		ps.close();
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #000000;
	font-family: "����_GB2312";
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> Ա����Ϣ��¼����ţ�<%=sq_yhxx_ygbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">����</div>            </td>
            <td width="32%"><%=bianhao%> </td>
            <td width="20%"> 
              <div align="right">Ա������</div>            </td>
            <td width="30%"> <%=sq_yhxx_yhmc%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">�����ֹ�˾</td>
            <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%> </td>
            <td width="20%" align="right">������λ</td>
            <td width="30%"><%=sq_dwxx_dwmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">��������С��</td>
            <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sq_yhxx_sjsbh+"'",sq_yhxx_sjsbh,true);
%></td>
            <td width="20%" align="right">���֤��</td>
            <td width="30%"><%=sq_yhxx_sfzh%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">�û���¼��</div>            </td>
            <td width="32%"> <%=sq_yhxx_yhdlm%> </td>
            <td width="20%"> 
              <div align="right">�û�����</div>            </td>
            <td width="30%"><%=cf.makejm(sq_yhxx_yhkl)%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">�û���ɫ</div>            </td>
            <td width="32%"> <%
	cf.selectToken(out,"A0+�ܲ�&A1+�ܲ�������&F0+�ֹ�˾&F1+�ֹ�˾������&F2+����&F3+����С��&G0+��Ӧ��&J0+������",sq_yhxx_yhjs,true);
%> </td>
            <td width="20%"> 
              <div align="right">�ɵ�½ϵͳ��־</div>            </td>
            <td width="30%"><%
	cf.radioToken(out, "Y+�ɵ�½&N+���ɵ�½",sq_yhxx_kdlxtbz,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">����鿴�۸���ϸ</div>            </td>
            <td width="32%"> <%
	cf.radioToken(out, "Y+�ɿ�&N+���ɿ�",sq_yhxx_ckjgbz,true);
%> </td>
            <td width="20%"> 
              <div align="right">�ص��û���־</div>            </td>
            <td width="30%"> <%
	cf.radioToken(out, "Y+��&N+��",sq_yhxx_zdyhbz,true);
%> </td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">�绰</div>            </td>
            <td width="32%"> <%=sq_yhxx_dh%> </td>
            <td width="20%"> 
              <div align="right">email</div>            </td>
            <td width="30%"> <%=sq_yhxx_email%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">����ְ��</td>
            <td width="32%"><%=xzzwbm%></td>
            <td width="20%" align="right">����</td>
            <td width="30%"><%=dm_zwbm_zwmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">��ְ����</td>
            <td width="32%"><%=sq_yhxx_rzsj%></td>
            <td width="20%" align="right">�μӹ���ʱ��</td>
            <td width="30%"><%=cjgzsj%></td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">Ա��״̬</div>            </td>
            <td width="32%"> <%
	cf.radioToken(out, "M+ʵϰ��&Y+ת��&N+������&D+����&S+��ְ&T+����",sq_yhxx_sfzszg,true);
%> </td>
            <td width="20%"> 
              <div align="right">��ְ����</div>            </td>
            <td width="30%"><%=sq_yhxx_lzrq%> </td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">סַ</td>
            <td colspan="3"><%=sq_yhxx_zz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">�������ڵ�</td>
            <td colspan="3"><%=sq_yhxx_hjszd%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">���ʦ����</td>
            <td width="32%"><%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb",sq_yhxx_sjsjb,true);
%></td>
            <td width="20%" align="right">�Ƿ��빫˾����������ϵ</td>
            <td width="30%"><%
	cf.radioToken(out, "Y+��&N+��",sq_yhxx_sfqs,true);
%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">���ۼ���</td>
            <td width="32%"><%
	cf.selectToken(out,"A+������ͨ&B+������ͨ����Ʒ&C+�����ֻ�÷����&D+������ͨ����Ʒ���ֻ�÷����&E+���þ�Ʒ���ֻ�÷����",sq_yhxx_bjjb,true);
%></td>
            <td width="20%" align="right">�����ۿ���</td>
            <td width="30%"><%=sq_yhxx_zkl%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">��ע</td>
            <td colspan="3"><%=sq_yhxx_bz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><b> </b></td>
            <td colspan="3"><b><%
	cf.selectToken(out,"0+����Ȩ&1+��Ȩ�����ֹ�˾&2+��Ȩ����ֹ�˾&3+��Ȩ��������&4+��Ȩĳһ�ֹ�˾�������&5+��Ȩ����ֹ�˾�������",kfgssq,true);
%></b>��<%=sqdwmc%></td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>

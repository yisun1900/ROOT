<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");
String dwbh=request.getParameter("dwbh");

String scbkhbh=request.getParameter("scbkhbh");


String yjbm=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String zt=null;
String sbyybm=null;
String sbyysm=null;
String sbdjr=null;
String sbdjsj=null;
String ssfgs=null;
String bz=null;
String cqbm=null;
String jiedao=null;
String xqbm=null;
String louhao=null;
String ywyssxz=null;
String xqlx=null;
String fwmj=null;
String hxbm=null;
String fj=null;
String khzyxz=null;
String yjzxsj=null;
String jzdsmc=null;
String sfxhf=null;
String xchfsj=null;
String dqbm=null;
String ywybm=null;
String yjsj=null;
int yjts=0;

String dhqh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select yjsj,SYSDATE-yjsj yjts,ywybm,yjbm,khxm,fwdz,lxfs,ywy,zt,sbyybm,sbyysm,sbdjr,sbdjsj,bz,cqbm,jiedao,xqbm,louhao,ywyssxz,xqlx,fwmj,hxbm,fj,khzyxz,yjzxsj,jzdsmc,sfxhf,xchfsj ";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where  scbkhbh='"+scbkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjts=rs.getInt("yjts");
		yjsj=cf.fillNull(rs.getDate("yjsj"));
		ywybm=cf.fillNull(rs.getString("ywybm"));
		yjbm=cf.fillNull(rs.getString("yjbm"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		zt=cf.fillNull(rs.getString("zt"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sbyysm=cf.fillNull(rs.getString("sbyysm"));
		sbdjr=cf.fillNull(rs.getString("sbdjr"));
		sbdjsj=cf.fillNull(rs.getDate("sbdjsj"));
		bz=cf.fillNull(rs.getString("bz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		xqlx=cf.fillNull(rs.getString("xqlx"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fj=cf.fillNull(rs.getString("fj"));
		khzyxz=cf.fillNull(rs.getString("khzyxz"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		jzdsmc=cf.fillNull(rs.getString("jzdsmc"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		xchfsj=cf.fillNull(rs.getDate("xchfsj"));
	}
	rs.close();
	ps.close();

	if (!zt.equals("3"))
	{
		out.println("�����г����ͻ�״̬����ȷ������������ѯ�Ǽǻ�ʧ��");
		return;
	}

	ls_sql="select ssfgs";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+yjbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	int scyjts=0;//�г��ͻ��ƽ���Ч����
	ls_sql="select dqbm,dhqh,scyjts";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		dhqh=cf.fillNull(rs.getString("dhqh"));
		scyjts=rs.getInt("scyjts");
	}
	rs.close();
	ps.close();

	if (scyjts!=0)
	{
		if (yjts>scyjts)
		{
			ls_sql="update crm_scbkhxx set zt='7',jsr=?,jssj=SYSDATE";//1�����٣�2��ʧ�ܣ�3���ƽ���4���ѽ��գ�5��׼���ƽ���6��׼��ʧ�ܣ�7���ƽ�����
			ls_sql+=" where scbkhbh='"+scbkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yhmc);
			ps.executeUpdate();
			ps.close();

			out.println("�������ƽ���"+yjts+"���죬������˾�涨������"+scyjts+"�����ƽ�ʧ��");
			return;
		}
	}

	if (dhqh==null || dhqh.equals(""))
	{
		out.println("�����޵绰���ţ�����ϵϵͳ����Ա");
		return;
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%" ><div align="center">
        <form method="post" action="SaveInsertCrm_zxkhxx3.jsp" name="insertform" target="_blank">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">���</td>
	<td  width="8%">�ͻ�����</td>
	<td  width="8%">�ƽ���</td>
	<td  width="10%">�ƽ�ʱ��</td>
	<td  width="12%">�ƽ�����</td>
	<td  width="55%">�ƽ�˵��</td>
</tr>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT scbkhbh,khxm,yjr,yjsj,dwmc,yjsm";
	ls_sql+=" FROM crm_scbkhyjjl,sq_dwxx";
    ls_sql+=" where crm_scbkhyjjl.yjbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and scbkhbh='"+scbkhbh+"'";
    ls_sql+=" order by yjsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%>
</table>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                <div align="right">�ͻ������ֹ�˾              </td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                <div align="right">��ѯ����              </td>
              <td width="32%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yjbm.equals(""))
		{
			out.println("<option value=\"\"></option>");
		}
		else{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yjbm+"' order by dwbh",yjbm);
		}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF">���������</td>
              <td><select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeSjsbh(insertform)">
                <option value=""></option>
                <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+yjbm+"' and dwlx in('F3') order by dwbh","");
%>
              </select></td>
              <td align="right">���ʦ</td>
              <td><select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <%
	if (!zwbm.equals("04"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+yjbm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
	
	}
	else{
		out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
	}
%>
              </select></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF">�г���</td>
              <td><select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywybm+"' order by dwbh",ywybm);
%>
              </select></td>
              <td align="right">�г���С��</td>
              <td><select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"'",ywyssxz);
%>
              </select></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF">ҵ��Ա</td>
              <td><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="50" readonly></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�곤</td>
              <td><select name="dianz" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and xzzwbm='���澭��' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
%>
              </select></td>
              <td align="right">�г�������</td>
              <td><select name="scbjl" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx where sq_yhxx.dwbh='"+ywybm+"' and xzzwbm='�г�������' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
%>
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">С������</td>
              <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx",xqlx);
%>
              </select></td>
              <td align="right">�ͻ���Դ����</td>
              <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm",khzyxz);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ͻ�����</td>
              <td><select name="khjl" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <%
	if (!zwbm.equals("03"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+yjbm+"' and sq_yhxx.zwbm='03' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
	
	}
	else{
		out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
	}
%>
              </select></td>
              <td align="right"><font color="#CC0000">*</font>�ǼǱ���</td>
              <td><input name="djbbh" type="text" value="" size="20" maxlength="20"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>�ͻ�����              </td>
              <td width="32%"> 
                <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50" onKeyUp="keyTo(xb[0])" >              </td>
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>�Ա�              </td>
              <td width="32%"> 
                <input type="radio" name="xb"  value="M" onKeyUp="keyTo(lxfs)">
                �� 
                <input type="radio" name="xb"  value="W" onKeyUp="keyTo(lxfs)">
                Ů </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">�г��ͻ���ϵ��ʽ</font></td>
              <td colspan="3"><%=lxfs%>&nbsp;&nbsp;&nbsp;&nbsp;<strong><font color="#0000FF">�밴��¼��绰����ť����¼����ϵ��ʽ</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000FF">��ϵ��ʽ</font></td>
              <td colspan="3"> 
                <input type="text" name="lxfs" value="" size="70" maxlength="100" readonly>
                <input type="hidden" name="khlxfs" value=""  >
                <input type="button" value="¼��绰" onClick="if (javaTrim(khxm)=='') {alert('¼��[�ͻ�����]');khxm.select();return false;};window.open('getLxfs.jsp?dhqh=<%=dhqh%>&khlxfs='+khlxfs.value+'&lxr='+khxm.value,'','height=400,width=800,top=200,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')""></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�����ʼ�</td>
              <td colspan="3"> 
                <input type="text" name="email" value="" size="40" maxlength="50">
                <font color="#FF0000">(ע�⣺�ж������<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>�������� </td>
              <td><select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(xqbm)" onChange="cf_fwdz(insertform)">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%>
                </select>              </td>
              <td align="right">�ֵ�</td>
              <td><input name="jiedao" type="text"  onChange="cf_fwdz(insertform)" onKeyUp="keyTo(fwdz)" value="<%=jiedao%>" size="20" maxlength="50"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>С��</td>
              <td><input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onKeyUp="changheIn(insertform)"  onblur="cf_fwdz(insertform)"></td>
              <td align="right"><font color="#CC0000">*</font>¥��</td>
              <td><input type="text" name="louhao" value="<%=louhao%>" size="20" maxlength="50" onKeyUp="keyTo(fwdz)"  onChange="cf_fwdz(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">&nbsp;</td>
              <td colspan="3">
				<select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
				</select>
			  ע�⣺<font color="#0000FF">���ݵ�ַ</font>���������ֵ���С����¥�ţ��Զ����ɣ�����¼��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font><font color="#0000FF">���ݵ�ַ</font></td>
              <td colspan="3"><input type="text" name="fwdz" value="<%=fwdz%>" size="73" maxlength="100" onKeyUp="keyTo(fwlxbm)" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��Чͨ�ŵ�ַ</td>
              <td colspan="3"><input name="yxtxdz" type="text" value="" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>�Ƿ�Զ�̿ͻ�</td>
              <td><input type="radio" name="sfyckh"  value="Y"  >
                ��
                <input type="radio" name="sfyckh"  value="N" >
                �� </td>
              <td align="right">�ɵ�����</td>
              <td><select name="pdqybm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                <option value=""></option>
                <%
		cf.selectItem(out,"select pdqybm,pdqymc from dm_pdqybm where dqbm='"+dqbm+"' order by pdqybm","");
%>
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�μӹ�˾�����</td>
              <td colspan="3"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:520PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx in('1','2') order by jc_cxhd.cxhdmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�μ�С�������</td>
              <td colspan="3"> 
                <select name="cxhdbmxq" style="FONT-SIZE:12PX;WIDTH:520PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx='3'  order by jc_cxhd.cxhdmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�μ�չ������</td>
              <td colspan="3"> 
                <select name="cxhdbmzh" style="FONT-SIZE:12PX;WIDTH:520PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx='4'  order by jc_cxhd.cxhdmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������ҵ</td>
              <td><select name="sshybm" id="sshybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select sshybm,sshymc from dm_sshybm order by sshybm","");
%>
              </select></td>
              <td align="right">ְҵ</td>
              <td><select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��������</td>
              <td colspan="3"><input name="gmyx" type="text" value="���ʩ�������ġ��Ҿߡ�����" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��������</td>
              <td width="32%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");
%> 
                </select>              </td>
              <td width="18%" align="right">������</td>
              <td width="32%"><select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(fj)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��������</td>
              <td width="32%"><select name="fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(hxbm)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");
%>
              </select></td>
              <td width="18%" align="right">���ۣ�Ԫ/m��</td>
              <td width="32%"> 
                <input type="text" name="fj" value="<%=fj%>" size="20" maxlength="20" onKeyUp="keyTo(cqbm)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ƻ�����ʱ��</td>
              <td width="32%"><input type="text" name="jhjfsj" value="" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)"></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <div align="right">����              </td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fwmj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                <div align="right">���ڽ������              </td>
              <td width="32%"> 
                <input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="8" onKeyUp="keyTo(fgyqbm)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" rowspan="4" align="right">
			  <font color="#CC0000">*</font>��Ϣ��Դ<BR>
              <B><font color="#0000CC">(�����ѡ)</font></B>			  </td>
              <td width="32%" rowspan="4" bgcolor="#FFFFFF"> 
                <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(khlxbm)" size="7" multiple>
                  <%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
%> 
                </select></td>
              <td width="18%" align="right">���Ҫ��</td>
              <td width="32%"> 
                <select name="fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(zxysbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">װ��Ԥ��</td>
              <td width="32%"> 
                <select name="zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(yjzxsj)" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">Ԥ��װ��ʱ��</td>
              <td width="32%"> 
                <input type="text" name="yjzxsj" value="<%=yjzxsj%>" size="20" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>��ϵ�ͻ�</td>
              <td width="32%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(hdbz)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#FFFFFF">��Ϣ��Դ˵��</td>
              <td colspan="3" bgcolor="#FFFFFF">
			  <input name="xxlysm" type="text" value="" size="73" maxlength="100"></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>�ص���־</td>
              <td width="32%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(hdr)">
                  <option value=""></option>
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm","");
%>
				</select>              </td>
              <td width="18%" align="right">�ص���</td>
              <td width="32%"> 
                <input type="text" name="hdr" value="" size="20" maxlength="20"  >              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">�ص�װ�޵�ַ</td>
              <td colspan="3"> 
                <input type="text" name="cgdz" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>�Ƿ���ط�              </td>
              <td width="32%"> 
                <input type="radio" name="sfxhf"  value="Y" >
                ��ط� 
                <input type="radio" name="sfxhf"  value="N" >
                ����ط� </td>
              <td width="18%" align="right"> 
                <div align="right">�ط�����              </td>
              <td width="32%"> 
                <input type="text" name="hfrq" value="" size="20" maxlength="10" onKeyUp="keyGo(bz)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>��Ч��Ϣ��־</td>
              <td width="32%"> 
                <input type="radio" name="yzxxbz" value="Y" checked>
                ��Ч��Ϣ</td>
              <td width="18%" align="right"><font color="#CC0000">*</font>��װ��־</td>
              <td width="32%"> 
                <input type="radio" name="jzbz" value="1">
                ��װ 
                <input type="radio" name="jzbz" value="2">
                ��װ </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����Ʒ��</td>
              <td><input name="clpp" type="text" value="" size="20" maxlength="20" ></td>
              <td align="right">���ƺ�</td>
              <td><input type="text" name="cph" value="" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��������</td>
              <td colspan="3"><input type="text" name="czms" value="" size="73" maxlength="50"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����Ҫ��</td>
              <td colspan="3"><textarea name="gnyq" cols="72" rows="3" ></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������</td>
              <td><input type="radio" name="hyzk" value="�ѻ�">
                �ѻ�
                <input type="radio" name="hyzk" value="δ��">
                δ�� </td>
              <td align="right">�Ƿ����װ��</td>
              <td><input type="radio" name="sfdkzx" value="��">
                ��
                <input type="radio" name="sfdkzx" value="��">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��������</td>
              <td><input type="text" name="hznl" value="" size="20" maxlength="20" ></td>
              <td align="right">����ͬס</td>
              <td><input type="radio" name="lrtz" value="��">
                ��
                <input type="radio" name="lrtz" value="��">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">ԤԼ����ʱ��</td>
              <td><input type="text" name="yylfsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">�´�����ʱ��</td>
              <td><input type="text" name="xclfsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ƻ���ƽ��ͼʱ��</td>
              <td><input type="text" name="jhctsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">�ƻ���Ч��ͼʱ��</td>
              <td><input type="text" name="jhcxgtsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ƻ���ʩ��ͼʱ��</td>
              <td><input type="text" name="jhcsgtsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">�ƻ������ӱ���ʱ��</td>
              <td><input type="text" name="jhzbjsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">¼����</font></td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
              <td><select name="zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <div align="right">��ע              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="71" rows="2" onKeyUp="keyTo(savebutton)"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
				<input type="hidden" name="scbkhbh"  value="<%=scbkhbh%>" >
                <input type="button"  value="����" onClick="f_do(insertform)" name="savebutton">
                <input type="button"  value="�����ٴδ���" onClick="insertform.savebutton.disabled=false" >              </td>
            </tr>
          </table>
        </form>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//����AJAX
%>

var lx;
//�����������ⵥ��ʱ����������ʧ
document.onclick=function()
{
	insertform.valuelist.style.display='none';
}

//�ı�����ֵ
function changheIn(FormName)
{   

	if(event.keyCode==13)//�س�
	{
		insertform.valuelist.style.display='none';
	}
	else if(event.keyCode==38)//�ϼ�ͷ
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
		mark="last";

		oldtext=FormName.xqbm.value;

		FormName.xqbm.value=FormName.valuelist.options[FormName.valuelist.length-1].text;
	}
	else if(event.keyCode==40)//�¼�ͷ
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[0].selected=true;
		mark="first";

		oldtext=FormName.xqbm.value;

		FormName.xqbm.value=FormName.valuelist.options[0].text;
	}
	else{//������
		if(FormName.xqbm.value=="") 
		{
			insertform.valuelist.style.display='none';
			return;
		}

		//��ȡ�ͺ��б�
		var actionStr="/dhzx/scbkh/GetListByAjax.jsp?dqbm=<%=dqbm%>&invalue="+FormName.xqbm.value;

//		window.open(actionStr);
		lx="1";
		openAjax(actionStr);  
	}

}                                                                                                                                                       


function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		//ȥ��ǰ��Ļ��з�
		while (true)
		{
			if (ajaxRetStr.substring(0,1)=="\r")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else if (ajaxRetStr.substring(0,1)=="\n")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else{
				break;
			}
		}

		//����������
		insertform.valuelist.length=0;

		if (ajaxRetStr!="")
		{
			insertform.valuelist.style.display='block';
			strToItem3(insertform.valuelist,ajaxRetStr);
		}
		else{
			insertform.valuelist.style.display='none';
		}
	}
	else if (lx=="2")
	{
		strToItem2(insertform.sjs,ajaxRetStr);
	}

}

//�ı���������Ŀ
function changeItem(FormName,field)
{
	if(event.keyCode==38)//�ϼ�ͷ
	{
		if (mark=="last")
		{
			mark="";
		}

		FormName.xqbm.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==0)
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.xqbm.value=oldtext;

				FormName.xqbm.focus();
			}
			else{
				mark="first";
			}
		}
	}
	else if(event.keyCode==40)//�¼�ͷ
	{
		if (mark=="first")
		{
			mark="";
		}

		FormName.xqbm.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==field.length-1)
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.xqbm.value=oldtext
				FormName.xqbm.focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)//�س�
	{
		insertform.valuelist.style.display='none';
		FormName.xqbm.focus();
	}
}

//˫����������Ŀ
function selectCk(FormName,field)
{
	insertform.valuelist.style.display='none';
	FormName.xqbm.value=field.options[field.selectedIndex].text;
	FormName.xqbm.focus();
}

function changeSjsbh(FormName)
{
	FormName.sjs.length=1;

	if (FormName.sjsbh.value=="")
	{
		return;
	}


	var sql;
	sql =" select yhmc";
	sql+=" from sq_yhxx ";
	sql+=" where sjsbh='"+FormName.sjsbh.value+"'";
	sql+=" and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') ";
	sql+=" ORDER BY yhmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	lx="2";
	openAjax(actionStr);

}

function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�;5��Ա���ص�
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      

function cf_fwdz(FormName)
{  
	FormName.jiedao.value=strTrim(FormName.jiedao.value);
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.jiedao.value+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//����FormName:Form������
{
	cf_fwdz(FormName);


	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}

	if(!(isEmail(FormName.email, "�����ʼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.fj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("������[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("������[С��]��");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("������[¥��]��");
		FormName.louhao.focus();
		return false;
	}
/*
*/
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhjfsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "Ԥ��װ��ʱ��"))) {
		return false;
	}
	if(	!selectChecked(FormName.xxlybm)) {
		alert("������[��Ϣ��Դ]��");
		FormName.xxlybm.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "���ڽ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq, "�ط�����"))) {
		return false;
	}


	if(	!radioChecked(FormName.sfxhf)) {
		alert("��ѡ��[�Ƿ���ط�]��");
		FormName.sfxhf[0].focus();
		return false;
	}
	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.hfrq)=="") {
			alert("��ѡ��[�ط�����]��");
			FormName.hfrq.focus();
			return false;
		}
	}
	else{
		FormName.hfrq.value="";
	}

	if(	javaTrim(FormName.khlxbm)=="") {
		alert("��ѡ��[��ϵ�ͻ�]��");
		FormName.khlxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.hdbz)=="") {
		alert("��ѡ��[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}


	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		if(	javaTrim(FormName.cgdz)=="") {
			alert("������[�ص�װ�޵�ַ]��");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("������[�ص���]��");
			FormName.hdr.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.yzxxbz)=="") {
		alert("������[��Ч��Ϣ��־]��");
		FormName.yzxxbz.focus();
		return false;
	}

	if(	!radioChecked(FormName.jzbz)) {
		alert("��ѡ��[��װ��־]��");
		FormName.jzbz[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.jhctsj, "�ƻ���ƽ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcxgtsj, "�ƻ���Ч��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhcsgtsj, "�ƻ���ʩ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhzbjsj, "�ƻ������ӱ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yylfsj, "ԤԼ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xclfsj, "�´�����ʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyckh)) {
		alert("��ѡ��[�Ƿ�Զ�̿ͻ� ]��");
		FormName.sfyckh[0].focus();
		return false;
	}


	FormName.submit();
	FormName.savebutton.disabled=true;
	return true;
}
//-->
</SCRIPT>

<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String dqbm=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cqbm=null;
String cgdz=null;
String yzxxbz=null;
String jzbz=null;

String sjs=null;
String khjl=null;

String nlqjbm=null;
String zybm=null;
String fj=null;
String yjzxsj=null;
String xqbm=null;
String ywy=null;

String jhjfsj=null;
String hdr=null;
String sjsbh=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;
String louhao=null;
String ssfgs=null;
String zxkhlrjc=null;
String qdkhbljc=null;
String dzbjjc=null;
String ysshbz=null;
String ysshyj=null;

String sfzdzbj=null;
String jhzbjsj=null;
String bjjb=null;
String sczbjsj=null;
String zjzbjsj=null;
String dzbjze=null;
String hth=null;
String sfzhm="";
String hyh=null;
String clgw=null;

double zdsjf=0;
double zgsjf=0;
double mrsjf=0;


String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select sfzhm,hth,khjl,ysshbz,ysshyj,ssfgs,louhao,ysrbm,rddqbm,hxwzbm,sjsbh,jzbz,jhjfsj,hdr,ywy,sjs,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,yzxxbz,nlqjbm,zybm,fj,yjzxsj,xqbm ";
	ls_sql+=" ,sfzdzbj,jhzbjsj,bjjb,sczbjsj,zjzbjsj,dzbjze,hyh,clgw";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hyh=cf.fillNull(rs.getString("hyh"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		hth=cf.fillNull(rs.getString("hth"));
		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		jhzbjsj=cf.fillNull(rs.getDate("jhzbjsj"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		sczbjsj=cf.fillNull(rs.getDate("sczbjsj"));
		zjzbjsj=cf.fillNull(rs.getDate("zjzbjsj"));
		dzbjze=cf.fillNull(rs.getString("dzbjze"));

		khjl=cf.fillNull(rs.getString("khjl"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshyj=cf.fillNull(rs.getString("ysshyj"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		jhjfsj=cf.fillNull(rs.getDate("jhjfsj"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ywy=cf.fillNull(rs.getString("ywy"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		yzxxbz=cf.fillNull(rs.getString("yzxxbz"));

		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		clgw=cf.fillNull(rs.getString("clgw"));
	}
	rs.close();
	ps.close();

	if (hth.equals(""))
	{
		ls_sql="select hth";
		ls_sql+=" from  crm_hthxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hth=cf.fillNull(rs.getString("hth"));
		}
		rs.close();
		ps.close();

		if (hth.equals(""))
		{
			out.println("���ѣ�����ѡΪ�ÿͻ����["+khbh+"]�����ͬ��");
		}

	}

	ls_sql=" select zdsjf,zgsjf,mrsjf ";
	ls_sql+=" from sq_yhxx,sq_sqbm";
	ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zdsjf=rs.getDouble("zdsjf");
		zgsjf=rs.getDouble("zgsjf");
		mrsjf=rs.getDouble("mrsjf");
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select zxkhlrjc,qdkhbljc,dzbjjc,dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));
		qdkhbljc=cf.fillNull(rs.getString("qdkhbljc"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();




}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>ǩ��ƺ�ͬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"><strong>ǩ��ƺ�ͬ</strong></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

      <form method="post" action="" name="editform" target="_blank"> 
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">�ͻ����� </font></td>
              <td bgcolor="#E8E8FF"><%=khxm%></td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">�Ա� </font></td>
              <td bgcolor="#E8E8FF"><%
	cf.radioToken(out,"M+��&W+Ů",xb,true);
%>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">���ݵ�ַ</font> </td>
              <td colspan="3" bgcolor="#E8E8FF"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">ҵ��Ա</font></td>
              <td bgcolor="#E8E8FF"><%=ywy%></td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">�ͻ�����</font></td>
              <td bgcolor="#E8E8FF"><%=khjl%></td>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">��������</font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm,true);
%>              </td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">ְҵ</font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm,true);
%>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">������</font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm,true);
%>              </td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">���ۣ�Ԫ/m��</font></td>
              <td bgcolor="#E8E8FF"><%=fj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"> ���� </font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%>              </td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"> ���ڽ������ </font></td>
              <td bgcolor="#E8E8FF"><%=fwmj%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"> �ص���־ </font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz,true);
%>              </td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"> �ص��� </font></td>
              <td bgcolor="#E8E8FF"><%=hdr%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">�ص�װ�޵�ַ</font></td>
              <td colspan="3" bgcolor="#E8E8FF"><%=cgdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">�Ƿ���ط� </font></td>
              <td bgcolor="#E8E8FF"><%
	cf.radioToken(out,"Y+��ط�&N+����ط�",sfxhf,true);
%>              </td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">�ط����� </font></td>
              <td bgcolor="#E8E8FF"><%=hfrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">��װ��־</font></td>
              <td bgcolor="#E8E8FF"><%
	cf.selectToken(out,"1+��װ&2+��װ",jzbz,true);
%></td>
              <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
              <td bgcolor="#E8E8FF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"> ��ע </font></td>
              <td colspan="3" bgcolor="#E8E8FF"><%=bz%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">��װ���ʦ</font></td>
              <td bgcolor="#FFFFFF">
              <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">���Ϲ���</font></td>
              <td bgcolor="#FFFFFF"><input type="text" name="clgw" value="<%=clgw%>" size="20" maxlength="20" readonly></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">��ͬ��</font></td>
              <td bgcolor="#FFFFFF">
				<input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" readonly></td>
              <td align="right" bgcolor="#FFFFFF">��Ա����</td>
              <td bgcolor="#FFFFFF"><input name="hyh" type="text" value="<%=hyh%>" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>ƽ����</td>
              <td bgcolor="#FFFFFF"><input type="text" name="pms" value="" size="20" maxlength="17" onChange="calValue(editform)">              </td>
              <td align="right" bgcolor="#FFFFFF">���֤����</td>
              <td bgcolor="#FFFFFF"><input type="text" name="sfzhm" value="<%=sfzhm%>" size="20" maxlength="18" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>��ǰ����</td>
              <td bgcolor="#FFFFFF"><input type="text" name="zqdj" value="<%=mrsjf%>" size="20" maxlength="17" onChange="calValue(editform)"></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">�ۺ󵥼�</font></td>
              <td bgcolor="#FFFFFF"><input type="text" name="dj" value="" size="20" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">�ۿ�</font></td>
              <td bgcolor="#FFFFFF"><input type="text" name="zkl" size="8" maxlength="9"  value="10" readonly>
                <b><font color="#0000FF">��>=0��<=10��</font></b></td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">��ǰ��ƺ�ͬ���</font></td>
              <td width="32%" bgcolor="#FFFFFF"><input type="text" name="zqsjhtje" value="" size="20" maxlength="16" readonly></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>�ۺ���ƺ�ͬ���</td>
              <td width="32%" bgcolor="#FFFFFF"><input type="text" name="sjhtje" value="" size="20" maxlength="16" onChange="calValue1(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>ǩ��ƺ�ͬʱ��</td>
              <td bgcolor="#FFFFFF"><input type="text" name="qsjhtsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE2"><font color="#0000CC">¼��ʱ��</font></span></td>
              <td bgcolor="#FFFFFF"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE2"><font color="#0000CC">¼����</font></span></td>
              <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
              <td align="right"><font color="#CC0000">*</font><span class="STYLE2"><font color="#0000CC">¼�벿��</font></span></td>
              <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><textarea name="bz" cols="75" rows="3"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
				<input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)" name="sbutton">
                  <input type="reset"  value="����">
				  <input type="button"  value="��ƺ�ͬ��ӡԤ��" onClick="f_dysjhtfj(editform)" name="dysjhtfj" disabled>
				  <%--<input type="button"  value="����Э�鲹��Э���ӡ" onClick="f_cxxydy(editform)" name="cxxydy" >--%>
				   <input type="button"  value="�������Ĵ���Э��" onClick="f_zcmxdy(editform)" name="zcmxdy" >
                </div>              </td>
            </tr>
          </table>
        </form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function calValue(FormName)
{  
	var zqsjhtje=FormName.pms.value*FormName.zqdj.value;
	zqsjhtje=round(zqsjhtje,2);
	FormName.zqsjhtje.value=zqsjhtje;

	FormName.zkl.value=10;

	FormName.dj.value=FormName.zqdj.value;

	FormName.sjhtje.value=FormName.zqsjhtje.value;
}

function calValue1(FormName)
{  
	var zkl=FormName.sjhtje.value*10.0/FormName.zqsjhtje.value;
	zkl=round(zkl,2);
	FormName.zkl.value=zkl;


	var dj=FormName.sjhtje.value/FormName.pms.value;
	dj=round(dj,2);
	FormName.dj.value=dj;
}

function f_cxxydy11(FormName)//����FormName:Form�����ƴ�ӡ��ͬԤ����ť
{

	FormName.action="/cxxydy/cxxydy11.jsp";
	FormName.submit();
	return true;
}
function f_zcmxdy(FormName)//����FormName:Form�����ƴ�ӡ��ͬԤ����ť
{

	FormName.action="/cxxydy/zcmxdy.jsp";
	FormName.submit();
	return true;
}
function f_dysjhtfj(FormName)//����FormName:Form�����ƴ�ӡ��ͬԤ����ť
{

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dyht/dysjhtfj.jsp";
	}
	else{
		FormName.action="/dyht/dysjhtfj.jsp";
	}
	FormName.submit();
	return true;
}
function f_cxxydy(FormName)//����FormName:Form�����ƴ�ӡ��ͬԤ����ť
{

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/cxxydy/cxxydy.jsp";
	}
	else{
		FormName.action="/cxxydy/cxxydy.jsp";
	}
	FormName.submit();
	return true;
}

function f_do(FormName)//����FormName:Form������
{
	calValue1(FormName);


	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sjs)=="") {
		alert("������[���ʦ]��");
		FormName.sjs.focus();
		return false;
	}

	if(	javaTrim(FormName.hth)=="") {
		alert("������[��ͬ��]��");
		FormName.hth.focus();
		return false;
	}
	if(	javaTrim(FormName.qsjhtsj)=="") {
		alert("������[ǩ��ƺ�ͬʱ��]��");
		FormName.qsjhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qsjhtsj, "ǩ��ƺ�ͬʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.pms)=="") {
		alert("������[ƽ����]��");
		FormName.pms.focus();
		return false;
	}
	if(!(isFloat(FormName.pms, "ƽ����"))) {
		return false;
	}

	if (parseFloat(FormName.pms.value)<=0)
	{
		alert("����[ƽ����]Ҫ����0");
		FormName.pms.select();
		return false;
	}


	if(	javaTrim(FormName.zqdj)=="") {
		alert("������[��ǰ����]��");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "��ǰ����"))) {
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("������[�ۿ�]��");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "�ۿ�"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("����[�ۿ�]Ӧ����0��10֮�䣡");
		FormName.zkl.select();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("������[�ۺ󵥼�]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "�ۺ󵥼�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqsjhtje)=="") {
		alert("������[��ǰ��ƺ�ͬ���]��");
		FormName.zqsjhtje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqsjhtje, "��ǰ��ƺ�ͬ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjhtje)=="") {
		alert("������[�ۺ���ƺ�ͬ���]��");
		FormName.sjhtje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjhtje, "�ۺ���ƺ�ͬ���"))) {
		return false;
	}

	if(!(isSfzhm(FormName.sfzhm, "���֤����"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}

    FormName.action="SaveEditCrm_zxkhxx.jsp";  
	FormName.submit();
	FormName.dysjhtfj.disabled=false;
	return true;
}
//-->
</SCRIPT>

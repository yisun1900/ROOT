<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
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
String lrdw=(String)session.getAttribute("dwbh");

String hth=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;

String zjxxh=null;
String dqbm=null;
String jzbz=null;
String zjxwcbz=null;
double wdzgce=0;
String qye=null;
double zjxje=0;
double zhzjxje=0;
double zkl=0;
double kglf=0;
double kqtk=0;

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String oldgckkspbz=null;
String newzjxxh=null;
String gcjdbm=null;
String gdjsjd="";
String sjsjsbz="";

int count=0;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_khxx.sjsjsbz,crm_khxx.gdjsjd,crm_khxx.gckkspbz,crm_khxx.gcjdbm,khbh,hth,khxm,fwdz,lxfs,dwbh,sgd,zjxm,sgbz,sjs,qyrq,jzbz,zjxwcbz,wdzgce,qye,zkl,zjxje,kglf,kqtk,zhzjxje,zjxxh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		oldgckkspbz=cf.fillNull(rs.getString("gckkspbz"));//���̿ۿ�������־
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//���̽���
		newzjxxh=cf.fillNull(rs.getString("zjxxh"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jzbz=rs.getString("jzbz");
		zjxwcbz=rs.getString("zjxwcbz");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getString("qye");
		zkl=rs.getDouble("zkl");
		zjxje=rs.getDouble("zjxje");
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		zhzjxje=rs.getDouble("zhzjxje");
	}
	rs.close();

	if (oldgckkspbz.equals("Y"))//N��δ������Y��������
	{
		out.println("���󣡹��̿ۿ����������������޸�");
		return;
	}
	if (gcjdbm.equals("5"))
	{
		out.println("���󣡿ͻ�����ᣬ�������޸�");
		return;
	}
	if (sjsjsbz.equals("2"))//0��δ���㣻1��ǩ�����㣻2���깤����
	{
		out.println("�������ʦ�ѽ��㣬�������޸�");
		return;
	}
	if (gdjsjd.equals("1"))//0��δ���㣻1���ѽ���
	{
		out.println("����ʩ�����ѽ��㣬�������޸�");
		return;
	}


	if (zjxwcbz.equals("2"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("����[������]����ɣ�������[¼��������]���뵽��ά������ȥ�޸�");
		window.location="/jsgl/khjs/EditCrm_zjxdj.jsp?zjxxh=<%=newzjxxh%>";
		//-->
		</SCRIPT>
		<%
		return;
	}

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();

	//��ȡ���µ��ӱ���++++++++++++++++
	double dzbj=0;
	//��ʼ��
	dzbj.Dzbj getdzbj=new dzbj.Dzbj();
	//��ȡ���ӱ��۽��
	if (newzjxxh.equals(""))
	{
		dzbj=getdzbj.getBjje(conn,khbh,"hd");
	}
	else{
		dzbj=getdzbj.getZjxHBjje(conn,khbh,newzjxxh,"hd");
	}

	if ((int)(wdzgce+zjxje)!=(int)dzbj)
	{
		out.println("<font color='#FF0033' SIZE=2px><strong>���ѣ�������ԭ���ۣ��ۼ������"+cf.formatDouble(wdzgce+zjxje)+"�������ڡ����ӱ����ܶ�:"+cf.formatDouble(dzbj)+"��<BR>����޸ı�����ϸ����ϵͳ�Զ����㡾�����������ʱ��ע�⡾ϵͳ������������Ƿ���ȷ</strong></font>");
	}


	//���������
	ls_sql="select NVL(max(substr(zjxxh,8,2)),0)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	
	zjxxh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���������</td>
	<td  width="5%">�����׶�</td>
	<td  width="7%">��ǰ���������</td>
	<td  width="5%">�۹����</td>
	<td  width="5%">��������</td>
	<td  width="7%">�ۺ����������</td>
	<td  width="6%">����ʱ��</td>
	<td  width="5%">¼����</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT  crm_zjxdj.zjxxh,zjxfsjdmc,crm_zjxdj.zjje,crm_zjxdj.kglf,crm_zjxdj.kqtk,crm_zjxdj.jzjje,fssj,crm_zjxdj.lrr";
	ls_sql+=" FROM crm_zjxdj,dm_zjxfsjd  ";
    ls_sql+=" where crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+)";
    ls_sql+=" and crm_zjxdj.khbh='"+khbh+"'";
    ls_sql+=" order by crm_zjxdj.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/gcgl/zjx/ViewCrm_zjxdj.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
}
%> 
</table>
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">��¼�������Ϣ����������ţ�<%=zjxxh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">��ͬ��</font></div>
              </td>
              <td width="33%"> <%=hth%> </td>
              <td width="19%"> 
                <div align="right"><font color="#0000CC">�ͻ�����</font></div>
              </td>
              <td width="31%"> <%=khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
              <td width="33%"><%=fwdz%></td>
              <td width="19%" align="right"><font color="#0000CC">�ʼ�</font></td>
              <td width="31%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">�绰</font></div>
              </td>
              <td width="33%"> <%=lxfs%> </td>
              <td width="19%"> 
                <div align="right"><font color="#0000CC">ǩԼ����</font></div>
              </td>
              <td width="31%"><%=qyrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">ǩԼ����</font></td>
              <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,false);
%></td>
              <td width="19%" align="right"><font color="#0000CC">���ʦ</font></td>
              <td width="31%"><%=sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">ʩ����</font></div>
              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,false);
%> </td>
              <td width="19%"> 
                <div align="right"><font color="#0000CC">ʩ������</font></div>
              </td>
              <td width="31%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000CC">�ۿ�</font></td>
              <td width="33%"><%=zkl%></td>
              <td align="right" width="19%">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000CC">����ԭ����</font></td>
              <td width="33%"><%=wdzgce%></td>
              <td align="right" width="19%"><font color="#0000CC">����ǩԼ��</font></td>
              <td width="31%"><%=qye%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000CC">��ǰ�ۼƹ���������</font></td>
              <td width="33%"><%=zjxje%></td>
              <td align="right" width="19%"><font color="#0000CC">�ۺ��ۼƹ���������</font></td>
              <td width="31%"><%=zhzjxje%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000CC">�ۼƼ�������</font></td>
              <td width="33%"><%=kglf%></td>
              <td align="right" width="19%"><font color="#0000CC">�ۼƼ����������</font></td>
              <td width="31%"><%=kqtk%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>��������׶�</td>
              <td width="33%"> 
                <select name="zjxfsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjxfsjd,zjxfsjdmc from dm_zjxfsjd order by zjxfsjd","");
%> 
                </select>
              </td>
              <td align="right" width="19%"><font color="#FF0000">*</font>�������ʱ��</td>
              <td width="31%"> 
                <input type="text" name="fssj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000FF">��ǰ���������</font></td>
              <td width="33%"> 
                <input type="text" name="zjje" value="0" size="10" maxlength="17" onChange="f_jzjje(insertform)" readonly>
                <font color="#CC0066"><strong>����Ϊ��������Ϊ��</strong></font> </td>
              <td rowspan="6" align="right" width="19%"><font color="#FF0000">*</font>������ԭ�� 
                <div align="right"></div>
                <div align="right"></div>
              </td>
              <td rowspan="6" width="31%"> 
                <select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="11" multiple>
                  <%
	cf.selectItem(out,"select zjxyybm,zjxyymc from dm_zjxyybm order by zjxyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font><font color="#0000FF">�ۺ����������</font></td>
              <td width="33%"> 
                <input type="text" name="jzjje" value="0" size="10" maxlength="17" readonly>
                <font color="#CC0066">����������</font><font color="#0000CC">�ۿ�</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>����۹����</td>
              <td width="33%"> 
                <input type="text" name="kglf" value="0" size="10" maxlength="17" >
                <font color="#CC0066"><strong>Ϊ����</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>�����������</td>
              <td width="33%"> 
                <input type="text" name="kqtk" value="0" size="10" maxlength="17" >
                <font color="#CC0066"><strong>Ϊ����</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" width="17%"><font color="#FF0000">*</font>��������ɱ�־</td>
              <td width="33%"> 
                <input type="radio" name="zjxwcbz" value="2" checked>
                �����</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>���̿ۿ�</td>
              <td width="33%">
                <input type="text" name="gckk" size="20" maxlength="17" value="0" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font><font color="#0000FF">¼����</font></td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">¼��ʱ��</font></td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>����˵��</td>
              <td colspan="3"> 
                <textarea name="zjxyysm" cols="74" rows="4"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="lrdw" value="<%=lrdw%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="7" readonly>
                <input type="hidden" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="17" readonly>
                <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
                <input type="button"  value="���ӷ���" onClick="f_lrfj(insertform)" name="zjfj" disabled>
                <input type="button"  value="�޸ķ���" onClick="f_xgfj(insertform)" name="xgfj" disabled>
                <input type="button"  value="Ԥ��������" onClick="f_dybj(insertform)" name="ck" disabled>
                <input type="reset"  value="����">
                <P> 
                  <input type="button"  value="ѡ�񱨼���Ŀ" onClick="f_xzxm(insertform)" name="lr" disabled>
                  <input type="button"  value="����Ŀ˳��" onClick="f_xmpx(insertform)" name="xmpx" disabled>
                  <input type="button"  value="ѡ�����շ�" onClick="f_ewlr(insertform)" name="ewlr" disabled>
                  <input type="button"  value="�޸������շ�" onClick="f_ewck(insertform)" name="xgsf" disabled>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jzjje(FormName)//����FormName:Form������
{
	var jzjje=FormName.zjje.value*<%=zkl%>/10;
	jzjje=round(jzjje,2);
	FormName.jzjje.value=jzjje;
}
function f_do(FormName)//����FormName:Form������
{
	f_jzjje(FormName);

	if(	javaTrim(FormName.zjxxh)=="") {
		alert("��ѡ��[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxfsjd)=="") {
		alert("������[��������׶�]��");
		FormName.zjxfsjd.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("������[�������ʱ��]��");
		FormName.fssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fssj, "�������ʱ��"))) {
		return false;
	}
	if(	!selectChecked(FormName.zjxyybm)) {
		alert("������[������ԭ��]��");
		FormName.zjxyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjje)=="") {
		alert("��ѡ��[���������]��");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "���������"))) {
		return false;
	}
	if(	javaTrim(FormName.kglf)=="") {
		alert("��ѡ��[�۹����]��");
		FormName.kglf.focus();
		return false;
	}
	if(!(isFloat(FormName.kglf, "�۹����"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") 
	{
		alert("��ѡ��[��������]��");
		FormName.kqtk.focus();
		return false;
	}

	if(!(isFloat(FormName.kqtk, "��������"))) 
	{
		return false;
	}

	if(	javaTrim(FormName.jzjje)=="") {
		alert("��ѡ��[�ۺ����������]��");
		FormName.jzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.jzjje, "�ۺ����������"))) {
		return false;
	}
	if(!FormName.zjxwcbz.checked) {
		alert("������[��������ɱ�־]��");
		FormName.zjxwcbz.focus();
		return false;
	}
	if(	javaTrim(FormName.gckk)=="") {
		alert("������[���̿ۿ�]��");
		FormName.gckk.select();
		return false;
	}
	if(!(isFloat(FormName.gckk, "���̿ۿ�"))) {
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
	if(	javaTrim(FormName.zjxyysm)=="") {
		alert("������[������˵��]��");
		FormName.zjxyysm.focus();
		return false;
	}
	FormName.action="SaveInsertCrm_zjxdj.jsp";
	FormName.submit();

	FormName.zjfj.disabled=false;
	FormName.xgfj.disabled=false;
	FormName.lr.disabled=false;
	FormName.xmpx.disabled=false;
	FormName.ewlr.disabled=false;
	FormName.xgsf.disabled=false;
	FormName.ck.disabled=false;

	return true;
}
function f_lrfj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}

function f_xgfj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}
function f_xzxm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}

	FormName.submit();
	return true;
}
function f_dybj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxJsList.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/Bj_khbjmxJsList.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_ewlr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_ewck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	FormName.submit();
	return true;
}

function f_xmpx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		winOpen("/gcgl/zjx/dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=wherekhbh%>",900,600,'YES',"NO");
	}
	else{
		winOpen("/gcgl/zjx/gzdzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=wherekhbh%>",900,600,'YES',"NO");
	}
}

//-->
</SCRIPT>

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
String jsdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String khbh=request.getParameter("khbh");
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String hth=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;
String jzbz=null;
String zjxwcbz=null;
String zjxxh=null;
double qye=0;
double wdzgce=0;
double hbssk=0;//������Ŀʵ�տ�

double zjxje=0;
double zhzjxje=0;
double sfke=0;
double zkl=0;
double khjsje=0;

String kbxbz=null;
String bxkssj=null;
String bxjzsj=null;
String bybxsm=null;



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int count=0;

double gckk=0;

String gdjsjlh=null;

int row=0;
String bgcolor=null;

try {
	conn=cf.getConnection();

	ls_sql="select zjxxh,khjsje,zkl,zjxwcbz,zjxje,zhzjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq,kbxbz,bxkssj,bxjzsj,bybxsm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	if (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		khjsje=rs.getDouble("khjsje");
		zkl=rs.getDouble("zkl");
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
		sfke=rs.getDouble("sfke");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");

		jzbz=cf.fillNull(rs.getString("jzbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		bybxsm=cf.fillNull(rs.getString("bybxsm"));
	}
	rs.close();
	ps.close();

	if (zjxwcbz.equals("1"))
	{
		out.println("��ʾ���ÿͻ�û���������������㹤�������ܽ���ʩ���ӽ���");
		//out.println("��ʾ���ÿͻ�û���������������㹤�������ܽ���ʩ���ӽ���");
		//return;
	}

	if (jzbz.equals(""))
	{
		jzbz="1";
	}


	//������Ŀ
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='92' and scbz='N'";//92��������Ŀ
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbssk=rs.getDouble(1);//���ջ�����Ŀ��
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and zffs='31' and zckx='92' and scbz='N'";//ת��������Ŀ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbssk=hbssk-rs.getDouble(1);
	}
	rs.close();
	ps.close();

/************************************************************************/
	
	//������
	ls_sql="select count(*)";
	ls_sql+=" from  kp_xjgdjl,crm_khxx";
	ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh and crm_khxx.sgd='"+sgd+"' and kp_xjgdjl.jsbz='N' and kp_xjgdjl.cfspbz in('2') ";//2��δ������3������ͨ����4������δͨ��
	ls_sql+=" and kp_xjgdjl.fkze>0 ";      //2006-03-02�޸Ĺ�   ֻ����������>0;
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("<P>���󣡷�����δ������¼�����ܽ���");
		return;
	}

/************************************************************************/

	//��ȡ��¼��
	ls_sql="select NVL(max(substr(gdjsjlh,8,2)),0)";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gdjsjlh=khbh+cf.addZero(count+1,2);


%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ʩ���ӽ��㣨�����¼�ţ�<%=gdjsjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">�ͻ����</td>
              <td width="30%"><%=khbh%></td>
              <td align="right" width="21%">��ͬ��</td>
              <td width="29%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="30%"><%=khxm%>��<%=lxfs%>�� </td>
              <td width="21%"> 
                <div align="right">�ʼ�����</div>
              </td>
              <td width="29%"><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="21%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="29%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">ǩԼ����</td>
              <td width="30%"><%=qyrq%></td>
              <td align="right" width="21%">ʵ���������</td>
              <td width="29%"><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">��ͬ��������</td>
              <td width="30%"><%=kgrq%></td>
              <td align="right" width="21%">��ͬ��������</td>
              <td width="29%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">ʵ�ʿ�������</td>
              <td width="30%"><%=sjkgrq%></td>
              <td align="right" width="21%">ʵ�ʿ�������</td>
              <td width="29%"><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%"><font color="#0000FF">ʩ����</font></td>
              <td width="30%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right" width="21%"><font color="#0000FF">��װ��־</font></td>
              <td width="29%"> 
                <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+��װ&2+��װ",jzbz,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%"><font color="#0000FF">��װǩԼ��</font></td>
              <td width="30%"> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">����ԭ����</font></td>
              <td width="29%"> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%"><font color="#0000FF">�ۺ��ۼ�������</font></td>
              <td width="30%"> 
                <input type="text" name="zhzjxje" value="<%=zhzjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">��ǰ�ۼ�������</font></td>
              <td width="29%"><%=zjxje%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%"><font color="#0000FF">����ʵ�ʷ�����</font></td>
              <td width="30%"><%=cf.doubleTrim(qye+zhzjxje,2)%>��<font color="#0000FF">ǩԼ��</font>��<font color="#0000FF">�ۺ�������</font>��</td>
              <td align="right" width="21%"><font color="#0000FF">����ʵ�տ��ܶ�</font></td>
              <td width="29%"> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#FF0000">*</font>���㷽ʽ</td>
              <td width="30%"> 
                <input type="radio" name="jsfs" value="2" checked>
                ������� </td>
              <td align="right" width="21%">�ͻ�������</td>
              <td width="29%"> 
                <input type="text" name="khjskze" value="<%=cf.doubleTrim(qye+zhzjxje,2)%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right">ʩ���ӳе����̿ۿ�</td>
              <td width="30%"> 
                <input type="text" name="sgdfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
              <td width="21%" align="right">���ʦ�е����̿ۿ�</td>
              <td width="29%"> 
                <input type="text" name="sjsfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">�ʼ�е����̿ۿ�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zjfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
              <td width="21%"> 
                <div align="right">��˾�е����̿ۿ�</div>
              </td>
              <td width="29%"> 
                <input type="text" name="gsfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">�������е����̿ۿ�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="qtfy" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)">
              </td>
              <td width="21%"> 
                <div align="right"><font color="#0000CC">���̿ۿ�</font></div>
              </td>
              <td width="29%"> 
                <input type="text" name="gckk" value="0" size="20" maxlength="17" onChange="f_gckk(insertform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">ʩ���ӷ���</td>
              <td width="30%"> 
                <input type="text" name="sgdfk" value="0" size="20" maxlength="17" >
              </td>
              <td align="right" width="21%">���ʦ����</td>
              <td width="29%"> 
                <input type="text" name="sjsfk" value="0" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">�ۿ���</font></td>
              <td width="30%"> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">���㵥λ</font></td>
              <td width="29%"> 
                <select name="jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsdw+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#0000FF">������</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="21%"> 
                <div align="right"><font color="#0000FF">����ʱ��</font></div>
              </td>
              <td width="29%"> 
                <input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
          </table>

		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#999999" align="center"> 
              <td colspan="4">��ȷ�ϱ�����Ϣ</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ɱ��ޱ�־</div>
              </td>
              <td colspan="3"> <%
	cf.radioToken(out, "kbxbz","Y+����&M+���ֱ���&N+������",kbxbz);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">���޿�ʼʱ��</td>
              <td width="33%"> 
                <input type="text" name="bxkssj" value="<%=bxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">���޽�ֹʱ��</td>
              <td width="31%"> 
                <input type="text" name="bxjzsj" value="<%=bxjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">����˵��</td>
              <td colspan="3"> 
                <textarea name="bybxsm" cols="71" rows="3"><%=bybxsm%></textarea>
              </td>
            </tr>
          </table>
  
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="6%">ѡ������Ŀ</td>
	<td width="35%">��Ŀ���ƣ�<font color="#FF0000"><b>�򹴴����ޣ����򹴲�����</b></font>��</td>
      <td width="59%">���˵��</td>
    </tr>
<%
	String bxxm=null;
	String xmsm=null;

	ls_sql="SELECT bxxm,xmsm";
	ls_sql+=" FROM crm_bxxmbm";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bxxm=rs.getString("bxxm");
		xmsm=rs.getString("xmsm");

		String sfbx="";
		String qksm="";
		String mark="";
		ls_sql="SELECT sfbx,qksm";
		ls_sql+=" FROM crm_khbxxm";
		ls_sql+=" where khbh='"+khbh+"' and bxxm='"+bxxm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sfbx=rs1.getString("sfbx");
			qksm=cf.fillNull(rs1.getString("qksm"));
		}
		rs1.close();
		ps1.close();

		if (sfbx.equals(""))
		{
			mark="checked";
		}
		else if (sfbx.equals("Y"))
		{
			mark="checked";
		}
		else{
			mark="";
		}

		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
		  <td>
			<input name="xzbxxm" type="checkbox" value="<%=bxxm%>" <%=mark%>>
		  </td>
		  <td><%=bxxm%>
			<input type="hidden" name="bxxm" value="<%=bxxm%>">
		</td>
		  <td>
			<input type="text" name="qksm" value="<%=qksm%>" size="56" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		</td>
		</tr>
		<%
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
          </table>
		  
		  
		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����" name="reset">
                  <input name="clzdyxm" disabled type="button" onClick="window.open('ClZdyXm.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')" value="�������Ϸ���">
                  <input name="dejs" disabled type="button" onClick="window.open('dejs.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')" value="�������">
                  <input name="button" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="�ͻ�������Ϣ">
                  <input type="button" value="�ؽ����Ϸ���" onClick="window.open('UpdateGlfx.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>')">
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
                  <input type="hidden" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>
                  <input name="sjcb" type="hidden" value="" size="20" maxlength="17" >
                </p>
                <p>
                  <input name="ckjs" disabled type="button" value="�鿴���������" onClick="window.open('ViewCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  <input name="dydz" disabled type="button" value="��ӡ������㵥(�ӳ�)" onClick="window.open('DySgdCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  <input name="dygs" disabled type="button" value="��ӡ������㵥(�ڲ�)" onClick="window.open('DyGSCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                </p>
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

function f_gckk(FormName)//����FormName:Form������
{
	var gk=FormName.sjsfy.value*1.0+FormName.sgdfy.value*1.0+FormName.zjfy.value*1.0+FormName.gsfy.value*1.0+FormName.qtfy.value*1.0;
	gk=parseInt(gk*100.0+0.5)/100.0;
	FormName.gckk.value=gk;
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jzbz)=="") {
		alert("��ѡ��[��װ��־]��");
		FormName.jzbz.focus();
		return false;
	}

	if(	javaTrim(FormName.qye)=="") {
		alert("������[����ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "����ǩԼ��"))) {
		return false;
	}
	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[����ԭ����]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "����ԭ����"))) {
		return false;
	}
	if(	javaTrim(FormName.zhzjxje)=="") {
		alert("������[�ۺ��ۼ�������]��");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "�ۺ��ۼ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("������[�ۿ���]��");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "�ۿ���"))) {
		return false;
	}

	if(	javaTrim(FormName.khsskze)=="") {
		alert("������[�ͻ�ʵ�տ��ܶ�]��");
		FormName.khsskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khsskze, "�ͻ�ʵ�տ��ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.hbssk)=="") {
		alert("������[������Ŀʵ�տ�]��");
		FormName.hbssk.focus();
		return false;
	}
	if(!(isFloat(FormName.hbssk, "������Ŀʵ�տ�"))) {
		return false;
	}

	if(	javaTrim(FormName.khjskze)=="") {
		alert("������[�ͻ�������]��");
		FormName.khjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjskze, "�ͻ�������"))) {
		return false;
	}


	if(!(isFloat(FormName.sjcb, "ʵ�ʳɱ�"))) {
		return false;
	}

	if(	javaTrim(FormName.gckk)=="") {
		alert("������[���̿ۿ�]��");
		FormName.gckk.focus();
		return false;
	}
	if(!(isFloat(FormName.gckk, "���̿ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfy)=="") {
		alert("������[���ʦ�е�����]��");
		FormName.sjsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfy, "���ʦ�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfy)=="") {
		alert("������[ʩ���ӳе�����]��");
		FormName.sgdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfy, "ʩ���ӳе�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zjfy)=="") {
		alert("������[�ʼ�е�����]��");
		FormName.zjfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zjfy, "�ʼ�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.gsfy)=="") {
		alert("������[��˾�е�����]��");
		FormName.gsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.gsfy, "��˾�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.qtfy)=="") {
		alert("������[�������е�����]��");
		FormName.qtfy.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfy, "�������е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("������[ʩ���ӷ���]��");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "ʩ���ӷ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfk)=="") {
		alert("������[���ʦ����]��");
		FormName.sjsfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfk, "���ʦ����"))) {
		return false;
	}



	if(	javaTrim(FormName.jsr)=="") {
		alert("������[������]��");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("������[����ʱ��]��");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jsdw)=="") {
		alert("��ѡ��[���㵥λ]��");
		FormName.jsdw.focus();
		return false;
	}




	if(	!radioChecked(FormName.kbxbz)) {
		alert("��ѡ��[�ɱ��ޱ�־]��");
		FormName.kbxbz[0].focus();
		return false;
	}

	if (FormName.kbxbz[0].checked || FormName.kbxbz[1].checked)
	{
		if(	javaTrim(FormName.bxkssj)=="") {
			alert("������[���޿�ʼʱ��]��");
			FormName.bxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxkssj, "���޿�ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.bxjzsj)=="") {
			alert("������[���޽�ֹʱ��]��");
			FormName.bxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxjzsj, "���޽�ֹʱ��"))) {
			return false;
		}

		var choo=0;

		var i = 0;
		if (<%=row%>==1){
			if( FormName.xzbxxm.checked ){
				choo=1;
			}
		} 
		else{ 
			for (i=0;i <<%=row%>;i++ ){
				if( FormName.xzbxxm[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("��ѡ�񡾱�����Ŀ��");
			return false;
		}
	
	}
	else{
		FormName.bxkssj.value="";
		FormName.bxjzsj.value="";

		if(	javaTrim(FormName.bybxsm)=="") {
			alert("��ѡ��[����˵��]��");
			FormName.bybxsm.focus();
			return false;
		}
	}






	FormName.action="SaveInsertCw_gdjsjl.jsp";
	FormName.submit();
	FormName.dejs.disabled=false;
	FormName.clzdyxm.disabled=false;
	FormName.ckjs.disabled=false;
	FormName.dydz.disabled=false;
	FormName.dygs.disabled=false;
	return true;
}

//-->
</SCRIPT>

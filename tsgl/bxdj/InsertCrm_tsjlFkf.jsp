<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String slbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
%>
<%

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;

String dwbh=null;
String dwmc=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;
String ssfgs=null;

String gcjdbm=null;
String zt=null;

String kbxbz=null;
String bxkssj=null;
String bxjzsj=null;
String bybxsm=null;
int syts=0;

String djbh=null;
String hfdjbz=null;
String djyy=null;
String djsj=null;
String djr=null;
String jhjdsj=null;

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;
//���޼�¼��
String tsjlh=null;

String jcppbz="Y";
String ysgdsflz="";
String wxfl="";

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select zt,gcjdbm,khbh,khxm,fwdz,lxfs,qtdh,crm_khxx.email,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sjkgrq,sjjgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz,fgsbh,kbxbz,bxkssj,bxjzsj,bybxsm,bxjzsj-SYSDATE syts";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+wherekhbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

		djbh=cf.fillNull(rs.getString("djbh"));
		hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
		djyy=cf.fillNull(rs.getString("djyy"));
		djsj=cf.fillNull(rs.getDate("djsj"));
		djr=cf.fillNull(rs.getString("djr"));
		jhjdsj=cf.fillNull(rs.getDate("jhjdsj"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));

		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		bybxsm=cf.fillNull(rs.getString("bybxsm"));
		syts=rs.getInt("syts");
	}
	rs.close();

	if (zt.equals("2") && !gcjdbm.equals("4") && !gcjdbm.equals("5"))//2����װ�ͻ���3����װ���˵� ��4���Ǽ�װ�ͻ�
	{
//		out.println("���󣡼�װ�ͻ�ֻ���깤���ܽ��б��޵Ǽ�");
//		return;
	}

	if (kbxbz.equals("Y"))//Y+����&M+���ֱ���&N+������&0+δ����&1+Ԥ��������
	{
		wxfl="1";//1�����ޣ�2���Ǳ���
	}
	else{
		wxfl="2";//1�����ޣ�2���Ǳ���
	}

	ls_sql="select cxbz";
	ls_sql+=" from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ysgdsflz=cf.fillNull(rs.getString(1));
	}
	rs.close();

	//�Ƿ����ü��ɶ���
	ls_sql="select jcppbz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jcppbz=cf.fillNull(rs.getString(1));
	}
	rs.close();

	ls_sql="select NVL(max(TO_NUMBER(substr(tsjlh,8,3))),0)";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	tsjlh=wherekhbh+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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

ybl.common.PageObject pageObj=new ybl.common.PageObject();
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="10%">����ʱ��</td>
		<td  width="9%">������Դ</td>
		<td  width="9%">�᰸״̬</td>
		<td  width="9%">���˹�֪ͨ</td>
		<td  width="11%">���β��Ŵ���</td>
		<td  width="52%">���ޱ�������</td>
	</tr>
	<%
	ls_sql="SELECT tsjlh,tsbxsj,slfsmc,DECODE(crm_tsjl.clzt,0,'δ����',1,'������',2,'�ڴ���',3,'�᰸','9','������') as clzt,DECODE(crm_tsjl.sfxtz,'Y','��֪ͨ','N','����֪ͨ') sfxtz,DECODE(crm_tsjl.zrbmclzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','E','����ʵ','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') zrbmclzt,tsnr";
	ls_sql+=" FROM crm_tsjl,dm_slfsbm";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and khbh='"+wherekhbh+"'  ";
	ls_sql+=" order by crm_tsjl.tsjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[5]="align='left'";

//������ʾ��
	String[] disColName={"tsbxsj","slfsmc","clzt","sfxtz","zrbmclzt","tsnr"};
	pageObj.setDisColName(disColName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsbxsj",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>


<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼�뱨����Ϣ�����޼�¼�ţ�<%=tsjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="25%" align="left"> <font color="#0000CC">�ͻ���ţ�</font><%=khbh%> 
              </td>
              <td width="25%"><font color="#0000CC">��ͬ�ţ�</font><%=hth%> </td>
              <td width="25%"> <font color="#0000CC">�ͻ�������</font><%=khxm%></td>
              <td width="25%"><font color="#0000CC">�ʼ�Ա��</font><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="2" align="left"><font color="#0000CC">���ݵ�ַ��</font><%=fwdz%> 
              </td>
              <td width="25%"><font color="#0000CC">ʵ�������ڣ�</font><%=sjkgrq%> </td>
              <td width="25%"><font color="#0000CC">ʵ�������ڣ�</font><%=sjjgrq%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="25%" align="left" bgcolor="#E8E8FF"><font color="#0000CC">ǩԼ���棺</font><%=dwmc%> 
              </td>
              <td width="25%"><font color="#0000CC">���ʦ��</font><%=sjs%> </td>
              <td width="25%"> <font color="#0000CC">ʩ���ӣ�</font><%=sgdmc%> </td>
              <td width="25%"><font color="#0000CC">ʩ�����飺</font><%=sgbz%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="25%" align="left"><font color="#0000CC">�طö����־��</font><%
	cf.selectToken(out,"0+δ����&1+���̻طö���&2+���ޱ��޻طö���&3+ȫ������",hfdjbz,true);
%> </td>
              <td width="25%"><font color="#0000CC">�����ˣ�</font><%=djr%> </td>
              <td width="25%"> <font color="#0000CC">����ʱ�䣺</font><%=djsj%></td>
              <td width="25%"><font color="#0000CC">�ƻ��ⶳʱ�䣺</font><%=jhjdsj%> 
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td colspan="4" align="left"><font color="#0000CC">����ԭ��</font><%=djyy%> 
              </td>
            </tr>
          </table>
<%
	if (kbxbz.equals("N"))
	{
		%> 
		<script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='�����п�'>ע�⣡�ÿͻ�[���ܱ���]</font></b></marquee><br>";
			document.write(ie);
		</script>
		<%
	}
	else if (kbxbz.equals("M"))
	{
		%> 
		<script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='�����п�'>ע�⣡�ÿͻ�[���ֱ���]</font></b></marquee><br>";
			document.write(ie);
		</script>
		<%
	}
	else if (kbxbz.equals("0"))
	{
		%> 
		<script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='�����п�'>ע�⣡�ÿͻ�[δ��������]</font></b></marquee><br>";
			document.write(ie);
		</script>
		<%
	}
	else if (kbxbz.equals("Y") && syts<0)
	{
		%> 
		<script language="javascript">
			var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='�����п�'>ע�⣡�ÿͻ������ѹ��ڣ����޽�ֹʱ�䣺"+bxjzsj+"</font></b></marquee><br>";
			document.write(ie);
		</script>
		<%
	}


%>
		  
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="29%"> <font color="#0000CC">�ɱ��ޱ�־</font>��<%
	cf.selectToken(out,"Y+����&M+���ֱ���&N+������&0+δ����&1+Ԥ��������",kbxbz,true);
%> </td>
              <td width="30%"><font color="#0000CC">���޿�ʼʱ��</font>��<%=bxkssj%></td>
              <td width="30%"><font color="#0000CC">���޽�ֹʱ��</font>��<%=bxjzsj%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="3"><%=bybxsm%></td>
            </tr>
          </table>
		  
		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
		    <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC">��ϵ��ʽ</font></td>
		      <td colspan="3"><%=lxfs%>
                  <input type="button" value="�޸���ϵ��ʽ" onClick="window.open('/khxx/EditLxfs.jsp?khbh=<%=khbh%>')"></td>
	        </tr>
		    <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC">�����ʼ�</font></td>
		      <td colspan="3"><%=email%> </td>
	        </tr>
		    <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font><font color="#0000CC">ԭʩ����</font></td>
		      <td>
                <select name="ysgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select> 
			  </td>
		      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">ԭʩ�����Ƿ���ְ</font></td>
		      <td><%
					cf.radioToken(out, "ysgdsflz","Y+��ְ&N+��",ysgdsflz,true);
				%></td>
	        </tr>
		    <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font><font color="#0000CC">ά�޷���</font></td>
		      <td bgcolor="#FFFFFF"><%
					cf.radioToken(out, "wxfl","1+����&2+�Ǳ���",wxfl,true);
				%></td>
		      <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
		      <td bgcolor="#FFFFFF">&nbsp;</td>
	        </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0033">*</font>������Դ</td>
              <td width="27%"> 
                <select name="slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
              </select>              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font>�ͻ�����ʱ��</td>
              <td width="38%"> 
                <input type="text" name="tsbxsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">¼����</font></td>
              <td width="27%"> 
              <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font></td>
              <td width="38%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>��������</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="tsnr" cols="73" rows="5"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">Ҫ����ʱ��</td>
              <td width="27%"> 
              <input type="text" name="yqjjsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="38%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="73" rows="2"></textarea>              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"><b>ע�⣺����¼������������ԭ�򡻣���ͨ����<font color="#0000CC">¼�����ԭ��</font>����ťһ��¼�����ԭ��</b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>���޴���</td>
              <td width="27%"> 
                <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getXlItem(insertform)">
                  <option value=""></option>
                  <%
	   cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm where tsdl='1' order by tslxbm","");
%> 
              </select>              </td>
              <td width="18%" rowspan="5" align="right" valign="top">�漰����</td>
              <td width="38%" rowspan="5" valign="top"> 
				<select name="tspp" style="FONT-SIZE:12PX;WIDTH:252PX" >
				  <option value=""></option>
				</select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>����С��</td>
              <td width="27%"> 
                <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getYyItem(insertform)">
                  <option value=""></option>
              </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>����ԭ��</td>
              <td width="27%"> 
                <select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
              </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0033">*</font>���β���</td>
              <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getZrbm(insertform)">
                <option value=""></option>
                <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%>
              </select></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>������</td>
              <td width="27%"><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
              </select></td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="slbm" value="<%=slbm%>">
                <input type="hidden" name="tsjlh" value="<%=tsjlh%>">
                <input type="hidden" name="khbh" value="<%=khbh%>">
                <input type="hidden" name="ssfgs" value="<%=ssfgs%>">
                <input type="hidden" name="jcppbz" value="<%=jcppbz%>">
                <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
                <input type="button"  value="¼�����ԭ��" onClick="f_lr(insertform)" name="lr" disabled>
                <input type="button"  value="�鿴����ԭ��" onClick="f_ck(insertform)" name="ck" disabled>
                <input name="button" type="button" onClick="window.open('/gcgl/jygcgl/jcgd/InsertGdm_gdjcjl.jsp?khbh=<%=khbh%>')"  value="Υ�����湤��" >
                <input type="reset"  value="����" name="reset">              </td>
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

<%
	//����Ajax
	cf.ajax(out);
%>

var czlx;

function getXlItem(FormName)
{
	if (FormName.tslxbm.value=='')
	{
		return;
	}

	czlx=1;

	FormName.tsxlbm.length=1;
	FormName.tsyybm.length=1;
	FormName.tspp.length=1;
	FormName.dwbh.value="";

	var actionStr="/tsgl/tsdj/InsertCx.jsp?jcppbz=<%=jcppbz%>&ssfgs=<%=ssfgs%>&khbh=<%=khbh%>&tslxbm="+FormName.tslxbm.value;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getYyItem(FormName)
{
	if (FormName.tsxlbm.value=='')
	{
		return;
	}

	czlx=2;

	FormName.tsyybm.length=1;

	var actionStr="/tsgl/tsdj/InsertCx.jsp?jcppbz=<%=jcppbz%>&ssfgs=<%=ssfgs%>&khbh=<%=khbh%>&tsxlbm="+FormName.tsxlbm.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getZrbm(FormName)
{
	if (FormName.dwbh.value=='')
	{
		return;
	}

	FormName.ygbh.length=1;

	czlx=3;

	var sql="select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.dwbh.value+"' order by yhmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		insertform.tsxlbm.length=1;
		var value1=getStrValue(ajaxRetStr,1);
		strToSelect(insertform.tsxlbm,value1);
	}
	else if (czlx==2)
	{
		insertform.tsyybm.length=1;
		var value3=getStrValue(ajaxRetStr,3);
		strToSelect(insertform.tsyybm,value3);

		insertform.tspp.length=1;
		var value4=getStrValue(ajaxRetStr,4);
		strToSelect(insertform.tspp,value4);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ygbh,ajaxRetStr);
	}
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("��ѡ��[���޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.slfsbm)=="") {
		alert("��ѡ��[������Դ]��");
		FormName.slfsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysgd)=="") {
		alert("��ѡ��[ԭʩ����]��");
		FormName.ysgd.focus();
		return false;
	}
	if(	javaTrim(FormName.ysgdsflz)=="") {
		alert("��ѡ��[ԭʩ�����Ƿ���ְ]��");
		FormName.ysgdsflz.focus();
		return false;
	}
	if(	javaTrim(FormName.wxfl)=="") {
		alert("��ѡ��[ά�޷���]��");
		FormName.wxfl.focus();
		return false;
	}
	if(	javaTrim(FormName.tsnr)=="") {
		alert("��ѡ��[��������]��");
		FormName.tsnr.focus();
		return false;
	}

	if(FormName.tsnr.value.length>400)
	{
		var length=FormName.tsnr.value.length;
		alert("����[��������]���ܳ���400���֣�Ŀǰ����"+length+"���֣������¼��");
		FormName.tsnr.focus();
		return false;
	}


	if(!(isDatetime(FormName.yqjjsj, "Ҫ����ʱ��"))) {
		return false;
	}
	

	if(	javaTrim(FormName.tsbxsj)=="") {
		alert("������[�ͻ�����ʱ��]��");
		FormName.tsbxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tsbxsj, "�ͻ�����ʱ��"))) {
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
	if(	javaTrim(FormName.slbm)=="") {
		alert("������[¼�벿��]��");
		FormName.slbm.focus();
		return false;
	}

	if(	javaTrim(FormName.tslxbm)=="") {
		alert("��ѡ��[���޴���]��");
		FormName.tslxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsxlbm)=="") {
		alert("��ѡ��[����С��]��");
		FormName.tsxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("��ѡ��[����ԭ��]��");
		FormName.tsyybm.focus();
		return false;
	}

	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[���β���]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("��ѡ��[������]��");
		FormName.ygbh.focus();
		return false;
	}

	if (FormName.tslxbm.value=="12")
	{
		if(	javaTrim(FormName.tspp)=="") {
			alert("������[�漰����]��");
			FormName.tspp.focus();
			return false;
		}
	}

	FormName.action="SaveInsertCrm_tsjlFkf.jsp";
	FormName.submit();

	FormName.bc.disabled=true;
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}
function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("��ѡ��[���޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	FormName.action="InsertCrm_tsbm.jsp";
	FormName.submit();
	return true;
}
function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("��ѡ��[���޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	FormName.action="Crm_tsbmList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
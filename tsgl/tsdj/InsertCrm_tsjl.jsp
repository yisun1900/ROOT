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
String zdyhbz=(String)session.getAttribute("zdyhbz");
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
//Ͷ�߼�¼��
String tsjlh=null;

String jcppbz="Y";

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,fwdz,lxfs,qtdh,crm_khxx.email,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sjkgrq,sjjgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+wherekhbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
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
	out.print("Exception: " + ls_sql);
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
		<td  width="8%">����Ǽ�</td>
		<td  width="8%">�������</td>
		<td  width="10%">����ʱ��</td>
		<td  width="8%">Ͷ����Դ</td>
		<td  width="8%">����״̬</td>
		<td  width="8%">��֪ͨ</td>
		<td  width="8%">���Ŵ���</td>
		<td  width="42%">Ͷ�߱�������</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT tsjlh,khldcs,tsbxsj,slfsmc,DECODE(crm_tsjl.clzt,0,'δ����',1,'������',2,'�ڴ���',3,'�᰸','9','������') as clzt,DECODE(crm_tsjl.sfxtz,'Y','��֪ͨ','N','����֪ͨ') sfxtz,DECODE(crm_tsjl.zrbmclzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','E','����ʵ','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') zrbmclzt,tsnr";
	ls_sql+=" FROM crm_tsjl,dm_slfsbm";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and khbh='"+wherekhbh+"'  ";
	ls_sql+=" order by crm_tsjl.tsjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","lddj.jsp");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("�Ǽ�");

//������ʾ��
	String[] disColName={"khldcs","tsbxsj","slfsmc","clzt","sfxtz","zrbmclzt","tsnr"};
	pageObj.setDisColName(disColName);

	pageObj.alignStr[6]="align='left'";

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsbxsj",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_khldjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khldcs",coluParm);//�в����������Hash��
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
      <div align="center"> ��¼��Ͷ����Ϣ��Ͷ�߼�¼�ţ�<%=tsjlh%>��</div>
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
              <td width="25%" align="left"><font color="#0000CC">ǩԼ���棺</font><%=dwmc%> 
              </td>
              <td width="25%"><font color="#0000CC">���ʦ��</font><%=sjs%> </td>
              <td width="25%"> <font color="#0000CC">ʩ���ӣ�</font><%=sgdmc%> </td>
              <td width="25%"><font color="#0000CC">ʩ�����飺</font><%=sgbz%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="25%" align="left"><font color="#0000CC">�طö����־��</font><%
	cf.selectToken(out,"0+δ����&1+���̻طö���&2+Ͷ�߱��޻طö���&3+ȫ������",hfdjbz,true);
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
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">��ϵ��ʽ</font></td>
              <td colspan="3"><%=lxfs%>
              <input type="button" value="�޸���ϵ��ʽ" onClick="window.open('/khxx/EditLxfs.jsp?khbh=<%=khbh%>')"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">�����ʼ�</font></td>
              <td colspan="3"><%=email%>          </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0033">*</font>Ͷ����Դ              </td>
              <td width="28%"> 
                <select name="slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
                </select>              </td>
              <td width="17%" align="right"> 
                <font color="#FF0033">*</font>�ͻ�Ͷ��ʱ��              </td>
              <td width="38%"> 
                <input type="text" name="tsbxsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>�ͷ�������</td>
              <td width="28%"> 
                <input type="text" name="slr" value="<%=yhmc%>" size="20" maxlength="20">              </td>
              <td width="17%" align="right"><font color="#FF0033">*</font>�ͷ�����ʱ��</td>
              <td width="38%"> 
                <input type="text" name="slsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">¼����</font></td>
              <td width="28%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font></td>
              <td width="38%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����רԱ</td>
              <td><select name="kszy" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='21' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
%>
              </select></td>
              <td align="right"><font color="#FF0033">*</font>�ͻ��������</td>
              <td><input type="text" name="khldcs" value="1" size="20" maxlength="8"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>Ͷ������</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="tsnr" cols="66" rows="7"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>���س̶�</td>
              <td width="28%"> 
                <select name="yzcdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm order by yzcdbm","");
%> 
                </select>              </td>
              <td width="17%" align="right">Ҫ����ʱ��</td>
              <td width="38%"> 
                <input type="text" name="yqjjsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>֪ͨ���β��ŷ�ʽ</td>
              <td width="28%"> 
                <input type="radio" name="sfxtz" value="Y">
                �˹�֪ͨ 
                <input type="radio" name="sfxtz" value="N" checked>
                �Զ�֪ͨ </td>
              <td width="17%" align="right"><font color="#FF0033">*</font>�Ƿ�����</td>
              <td width="38%"> 
                <input type="radio" name="sfla" value="Y" checked>
                �� 
                <input type="radio" name="sfla" value="N">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font>�Ƿ����ڲ�����</td>
              <td><input type="radio" name="sfxnbgz" value="Y" >
��ط�
  <input name="sfxnbgz" type="radio" value="N" checked>
����ط� </td>
              <td align="right">�ڲ�����ʱ��</td>
              <td><input name="nbgzsj" type="text" id="nbgzsj" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0033">*</font>�Ƿ���ط�              </td>
              <td width="28%"> 
                <input type="radio" name="sfxhf" value="Y" checked>
                ��ط� 
                <input type="radio" name="sfxhf" value="N">
                ����ط� </td>
              <td width="17%" align="right"> 
                �ط�ʱ��              </td>
              <td width="38%"> 
                <input type="text" name="hfsj" value="<%=cf.addDay(1)%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="66" rows="2"></textarea>              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"><b>ע�⣺����¼��������Ͷ��ԭ�򡻣���ͨ����<font color="#0000CC">¼�����ԭ��</font>����ť¼�����ԭ��</b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>Ͷ�ߴ���</td>
              <td width="28%"> 
                <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getXlItem(insertform)">
                  <option value=""></option>
                  <%
	   cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm where tsdl='2' order by tslxbm","");
%> 
                </select>              </td>
              <td width="17%" rowspan="6" align="right" valign="top">�漰����</td>
              <td width="38%" rowspan="6" valign="top"> 

				  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="xllb" >
					<tr>
					  <td >
						<select name="tspp" style="FONT-SIZE:12PX;WIDTH:252PX" >
						  <option value=""></option>
						</select>					  </td>
					</tr>
				  </table>

				  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="rglr" style="display:none">
					<tr>
					  <td >
						<input type="text" name="rglrtspp" size="34" maxlength="50" >					  </td>
					</tr>
			  </table>			  </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>Ͷ��С��</td>
              <td width="28%"> 
                <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getYyItem(insertform)">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>Ͷ��ԭ��</td>
              <td width="28%"> 
                <select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td width="17%" align="right"><font color="#FF0033">*</font>���β���</td>
              <td width="28%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:200PX" onChange="getZrbm(insertform)">
                  <option value=""></option>
                  <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0033">*</font>������</td>
              <td><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">�漰����</td>
              <td width="28%">

<%
	if (zdyhbz.equals("Y"))
	{
		%>
		<input type="radio" name="rglrbz" value="1" checked onClick="xllb.style.display ='block';rglr.style.display ='none';">
		�������б�ѡ 
		<input type="radio" name="rglrbz" value="2" onClick="xllb.style.display ='none';rglr.style.display ='block';">
		�˹�¼�� 
		<%
	}
	else{
		%>
		<input type="radio" name="rglrbz" value="1" checked >
		�������б�ѡ 
		<%
	}
%>              </td>
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
                <input type="button"  value="�鿴Ͷ��ԭ��" onClick="f_ck(insertform)" name="ck" disabled>
                <input type="button"  value="Υ�����湤��" onClick="window.open('/gcgl/jygcgl/jcgd/InsertGdm_gdjcjl.jsp?khbh=<%=khbh%>')" >
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
		alert("��ѡ��[Ͷ�߼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.slfsbm)=="") {
		alert("��ѡ��[Ͷ����Դ]��");
		FormName.slfsbm.focus();
		return false;
	}

	if(	javaTrim(FormName.tsnr)=="") {
		alert("��ѡ��[Ͷ������]��");
		FormName.tsnr.focus();
		return false;
	}

	if(FormName.tsnr.value.length>400)
	{
		var length=FormName.tsnr.value.length;
		alert("����[Ͷ������]���ܳ���400���֣�Ŀǰ����"+length+"���֣������¼��");
		FormName.tsnr.focus();
		return false;
	}

	if(	javaTrim(FormName.yzcdbm)=="") {
		alert("��ѡ��[���س̶�]��");
		FormName.yzcdbm.focus();
		return false;
	}

	if(!(isDatetime(FormName.yqjjsj, "Ҫ����ʱ��"))) {
		return false;
	}
	

	if(	!radioChecked(FormName.sfxtz)) {
		alert("��ѡ��[���˹�֪ͨ���β���]��");
		FormName.sfxtz[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfla)) {
		alert("��ѡ��[�Ƿ�����]��");
		FormName.sfla[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxnbgz)) {
		alert("��ѡ��[�Ƿ����ڲ�����]��");
		FormName.sfxnbgz[0].focus();
		return false;
	}
	if (FormName.sfxnbgz[0].checked)
	{
		if(	javaTrim(FormName.nbgzsj)=="") {
			alert("������[�ڲ�����ʱ��]��");
			FormName.nbgzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.nbgzsj, "�ڲ�����ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.nbgzsj.value="";
	}

	if(	!radioChecked(FormName.sfxhf)) {
		alert("��ѡ��[�Ƿ���ط�]��");
		FormName.sfxhf[0].focus();
		return false;
	}

	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.hfsj)=="") {
			alert("������[�ط�ʱ��]��");
			FormName.hfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.hfsj, "�ط�ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.hfsj.value="";
	}


	if(	javaTrim(FormName.tsbxsj)=="") {
		alert("������[�ͻ�Ͷ��ʱ��]��");
		FormName.tsbxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tsbxsj, "�ͻ�Ͷ��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("������[�ͷ�������]��");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("������[�ͷ�����ʱ��]��");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "�ͷ�����ʱ��"))) {
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
		alert("��ѡ��[Ͷ�ߴ���]��");
		FormName.tslxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsxlbm)=="") {
		alert("��ѡ��[Ͷ��С��]��");
		FormName.tsxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("��ѡ��[Ͷ��ԭ��]��");
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


/*
	if (FormName.tslxbm.value=="12")
	{
		<%
		if (zdyhbz.equals("Y"))
		{
			%> 
			if (FormName.rglrbz[0].checked)//�������б�ѡ
			{
				if(	javaTrim(FormName.tspp)=="") {
					alert("����б���ѡ��[�漰����]�����б��в����ڣ���ѡ���˹�¼�롿��");
					FormName.tspp.focus();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.rglrtspp)=="") {
					alert("���˹�¼��[�漰����]��");
					FormName.rglrtspp.focus();
					return false;
				}
			}
			<%
		}
		else{
			%> 
			if(	javaTrim(FormName.tspp)=="") {
				alert("����б���ѡ��[�漰����]��");
				FormName.tspp.focus();
				return false;
			}
			<%
		}
		%>
	}
*/

	if(	javaTrim(FormName.khldcs)=="") {
		alert("��ѡ��[�ͻ��������]��");
		FormName.khldcs.focus();
		return false;
	}
	if(!(isNumber(FormName.khldcs, "�ͻ��������"))) {
		return false;
	}

	FormName.action="SaveInsertCrm_tsjl.jsp";
	FormName.submit();

	FormName.bc.disabled=true;
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}
function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("��ѡ��[Ͷ�߼�¼��]��");
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
		alert("��ѡ��[Ͷ�߼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	FormName.action="Crm_tsbmList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String sgd=cf.GB2Uni(request.getParameter("sgd"));

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK"></head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��?1��?��?���̣���3??</font></B>
</CENTER>
  <%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,pdsj,pdr,DECODE(jlbz,'0','??3��?���̣�','1','??�̣�?����?','2','1????����?','3','����??��|???��?���̣�','4','?��?��???��?���̣�','5','�䨮�̣���???�̣�','6','??�̣���?�䨮�̣�'),pdsm,DECODE(kgzbz,'Y','??3?','N','<font color=\"#FF00FF\">?��3?</font>'),DECODE(NVL(tgbz,'W'),'W','??3��','N','<font color=\"#00FF00\">?��1��</font>','Y','<font color=\"#FF0000\">??����1��</font>'),ysgcjdmc,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,a.dwmc qydm,crm_khxx.qyrq,jgrq,crm_khxx.qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+) ";
    ls_sql+=" and crm_khxx.sgd='"+sgd+"' and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.gcjdbm not in('4','5')";

    ls_sql+=" union ";

	ls_sql+=" SELECT crm_khxx.hth,crm_khxx.khxm,pdsj,pdr,DECODE(jlbz,'0','??3��?���̣�','1','??�̣�?����?','2','1????����?','3','����??��|???��?���̣�','4','?��?��???��?���̣�','5','�䨮�̣���???�̣�','6','??�̣���?�䨮�̣�'),pdsm,DECODE(kgzbz,'Y','??3?','N','<font color=\"#FF00FF\">?��3?</font>'),DECODE(NVL(tgbz,'W'),'W','??3��','N','<font color=\"#00FF00\">?��1��</font>','Y','<font color=\"#FF0000\">??����1��</font>'),ysgcjdmc,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,a.dwmc qydm,crm_khxx.qyrq,jgrq,crm_khxx.qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+) ";
    ls_sql+=" and crm_khxx.sgd='"+sgd+"' and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.pdsj>=TO_DATE('"+cf.firstOfYear()+"','YYYY-MM-DD') and crm_khxx.pdsj<=SYSDATE";
	ls_sql+=" and crm_khxx.gcjdbm in('4','5')";

    ls_sql+=" order by pdsj";
	//out.println(ls_sql);
	pageObj.sql=ls_sql;
//???????��3?��??��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

//����??��?3???��??��
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����3��????��?2?��????��
	String[] coluKey={"hth"};//����??��?2?��?��ocoluParm.key��??��?��
	coluParm.key=coluKey;//����??��?2?��?��ocoluParm.key��??��?��
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//?a��?2?��?��ocoluParm.link����??3???����?��
	coluParm.bolt="target='_blank'";//?a��?2?��?��ocoluParm.link����??3???����?��
	coluParmHash.put("khxm",coluParm);//��?2?��????��?����?Hash����
	pageObj.setColuLink(coluParmHash);//��?2?��????��?����?Hash����


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="5%">o?��?o?</td>
	<td  width="3%">?��?��????</td>
	<td  width="5%">?���̣�����??</td>
	<td  width="4%">?���̣���?</td>
	<td  width="4%">?���̣�����?��</td>
	<td  width="12%">?���̣�?��?��</td>
	<td  width="3%">?a1��?��</td>
	<td  width="3%">����1��</td>
	<td  width="4%">1��3????��</td>
	<td  width="17%">��???��??��</td>
	<td  width="3%">����??��|</td>
	<td  width="3%">��?1��?��</td>
	<td  width="3%">?��??</td>
	<td  width="5%">??��?1��3??����?</td>
	<td  width="5%">???��?����?</td>
	<td  width="7%">????�̨�??</td>
	<td  width="5%">????��??��</td>
	<td  width="5%">o?��??��1�訨??��</td>
	<td  width="4%">1��3???????</td>
  </tr>

<%
	pageObj.displayDate();
%> 
</table>
</body>
</html>

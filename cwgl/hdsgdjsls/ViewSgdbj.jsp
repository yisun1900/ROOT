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
  <B><font size="3">ê?1¤?ó?éμ￥í3??</font></B>
</CENTER>
  <%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,pdsj,pdr,DECODE(jlbz,'0','??3￡?éμ￥','1','??μ￥?±à?','2','1????±à?','3','éè??ê|???¨?éμ￥','4','?í?§???¨?éμ￥','5','′óμ￥μ???μ￥','6','??μ￥μ?′óμ￥'),pdsm,DECODE(kgzbz,'Y','??3?','N','<font color=\"#FF00FF\">?′3?</font>'),DECODE(NVL(tgbz,'W'),'W','??3￡','N','<font color=\"#00FF00\">?′1¤</font>','Y','<font color=\"#FF0000\">??í￡1¤</font>'),ysgcjdmc,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,a.dwmc qydm,crm_khxx.qyrq,jgrq,crm_khxx.qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+) ";
    ls_sql+=" and crm_khxx.sgd='"+sgd+"' and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.gcjdbm not in('4','5')";

    ls_sql+=" union ";

	ls_sql+=" SELECT crm_khxx.hth,crm_khxx.khxm,pdsj,pdr,DECODE(jlbz,'0','??3￡?éμ￥','1','??μ￥?±à?','2','1????±à?','3','éè??ê|???¨?éμ￥','4','?í?§???¨?éμ￥','5','′óμ￥μ???μ￥','6','??μ￥μ?′óμ￥'),pdsm,DECODE(kgzbz,'Y','??3?','N','<font color=\"#FF00FF\">?′3?</font>'),DECODE(NVL(tgbz,'W'),'W','??3￡','N','<font color=\"#00FF00\">?′1¤</font>','Y','<font color=\"#FF0000\">??í￡1¤</font>'),ysgcjdmc,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,a.dwmc qydm,crm_khxx.qyrq,jgrq,crm_khxx.qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+) ";
    ls_sql+=" and crm_khxx.sgd='"+sgd+"' and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.pdsj>=TO_DATE('"+cf.firstOfYear()+"','YYYY-MM-DD') and crm_khxx.pdsj<=SYSDATE";
	ls_sql+=" and crm_khxx.gcjdbm in('4','5')";

    ls_sql+=" order by pdsj";
	//out.println(ls_sql);
	pageObj.sql=ls_sql;
//???????ó3?ê??ˉ
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

//éè??á?3???á??ó
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//éú3é????á?2?ê????ó
	String[] coluKey={"hth"};//éè??á?2?ê?￡ocoluParm.keyμ??÷?ü
	coluParm.key=coluKey;//éè??á?2?ê?￡ocoluParm.keyμ??÷?ü
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//?aá?2?ê?￡ocoluParm.linkéè??3???á′?ó
	coluParm.bolt="target='_blank'";//?aá?2?ê?￡ocoluParm.linkéè??3???á′?ó
	coluParmHash.put("khxm",coluParm);//á?2?ê????ó?óè?Hash±í
	pageObj.setColuLink(coluParmHash);//á?2?ê????ó?óè?Hash±í


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="5%">o?í?o?</td>
	<td  width="3%">?í?§????</td>
	<td  width="5%">?éμ￥ê±??</td>
	<td  width="4%">?éμ￥è?</td>
	<td  width="4%">?éμ￥àà?í</td>
	<td  width="12%">?éμ￥?μ?÷</td>
	<td  width="3%">?a1¤?¤</td>
	<td  width="3%">í￡1¤</td>
	<td  width="4%">1¤3????è</td>
	<td  width="17%">·???μ??·</td>
	<td  width="3%">éè??ê|</td>
	<td  width="3%">ê?1¤?ó</td>
	<td  width="3%">?ê??</td>
	<td  width="5%">??±?1¤3??éê?</td>
	<td  width="5%">???ú?éê?</td>
	<td  width="7%">????μê??</td>
	<td  width="5%">????è??ú</td>
	<td  width="5%">o?í??￠1¤è??ú</td>
	<td  width="4%">1¤3???????</td>
  </tr>

<%
	pageObj.displayDate();
%> 
</table>
</body>
</html>

<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xjjlh=null;


	xjjlh=request.getParameter("xjjlh");
	if (xjjlh!=null)
	{
		xjjlh=cf.GB2Uni(xjjlh);
		if (!(xjjlh.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjlh='"+xjjlh+"')";
	}
	
	ls_sql="SELECT kp_xjgdjl.xjjlh,DECODE(cfspbz,'1','��������','2','δ����','3','����ͨ��','4','����δͨ��'),DECODE(kp_xjgdjl.kpbz,'N','δ����','Y','�ѿ���'),DECODE(kp_xjgdjl.jsbz,'N','δ����','Y','�ѽ���'),sgdmc,fkze,kfzs,jlje,kp_xjgdjl.kcjdebl||'%',crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,kp_xjgdjl.xjr,kp_xjgdjl.xjsj,xjlxmc,xjjgmc,kp_xjgdjl.bz,crm_khxx.sjs,crm_khxx.zjxm,kp_xjgdjl.lrr,kp_xjgdjl.lrsj,dwmc  ";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd,kp_xjlxbm,dm_xjjgbm,sq_dwxx  ";
    ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+)";
    ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm";
	ls_sql+=" and kp_xjgdjl.lrdw=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_xjgdjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_xjgdjlCxAllList.jsp","SelectCxAllKp_xjgdjl.jsp","","");
	pageObj.setPageRow(25);
/*
//������ʾ��
	String[] disColName={"xjjlh","kp_xjgdjl_khbh","kp_xjgdjl_xjr","kp_xjgdjl_xjsj","xjlxbm","dm_xjjgbm_xjjgmc","kp_xjgdjl_lrr","kp_xjgdjl_lrsj","kp_xjgdjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xjjlh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"xjjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_xjgdjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xjjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ���Ӽ���¼--��ѯȫ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">����¼��</td>
	<td  width="4%">������־</td>
	<td  width="3%">������־</td>
	<td  width="3%">�����־</td>
	<td  width="3%">ʩ����</td>
	<td  width="4%">�����ܶ�</td>
	<td  width="4%">�۷�����</td>
	<td  width="4%">�������</td>
	<td  width="4%">�۳��ӵ���ٷֱ�</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="3%">�����</td>
	<td  width="4%">���ʱ��</td>
	<td  width="5%">�������</td>
	<td  width="6%">�����</td>
	<td  width="13%">������˵��</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">���</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>
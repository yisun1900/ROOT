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
	String cw_jryjkh_khzq=null;
	String cw_jryjkh_fgsbh=null;
	String cw_jryjkh_dwbh=null;
	String cw_jryjkh_yhmc=null;
	cw_jryjkh_khzq=request.getParameter("cw_jryjkh_khzq");
	if (cw_jryjkh_khzq!=null)
	{
		cw_jryjkh_khzq=cf.GB2Uni(cw_jryjkh_khzq);
		if (!(cw_jryjkh_khzq.equals("")))	wheresql+=" and  (cw_jryjkh.khzq='"+cw_jryjkh_khzq+"')";
	}
	cw_jryjkh_fgsbh=request.getParameter("cw_jryjkh_fgsbh");
	if (cw_jryjkh_fgsbh!=null)
	{
		cw_jryjkh_fgsbh=cf.GB2Uni(cw_jryjkh_fgsbh);
		if (!(cw_jryjkh_fgsbh.equals("")))	wheresql+=" and  (cw_jryjkh.fgsbh='"+cw_jryjkh_fgsbh+"')";
	}
	cw_jryjkh_dwbh=request.getParameter("cw_jryjkh_dwbh");
	if (cw_jryjkh_dwbh!=null)
	{
		cw_jryjkh_dwbh=cf.GB2Uni(cw_jryjkh_dwbh);
		if (!(cw_jryjkh_dwbh.equals("")))	wheresql+=" and  (cw_jryjkh.dwbh='"+cw_jryjkh_dwbh+"')";
	}
	cw_jryjkh_yhmc=request.getParameter("cw_jryjkh_yhmc");
	if (cw_jryjkh_yhmc!=null)
	{
		cw_jryjkh_yhmc=cf.GB2Uni(cw_jryjkh_yhmc);
		if (!(cw_jryjkh_yhmc.equals("")))	wheresql+=" and  (cw_jryjkh.yhmc='"+cw_jryjkh_yhmc+"')";
	}
	ls_sql="SELECT cw_jryjkh.khzq,cw_jryjkh.khqssj,cw_jryjkh.khjzsj,a.dwmc fgs,cw_jryjkh.dwbh,b.dwmc,cw_jryjkh.yhmc,zwmc,cw_jryjkh.byrw,cw_jryjkh.lrr,cw_jryjkh.lrsj,cw_jryjkh.bz  ";
	ls_sql+=" FROM cw_jryjkh,sq_dwxx a,sq_dwxx b,dm_zwbm  ";
    ls_sql+=" where cw_jryjkh.fgsbh=a.dwbh(+)";
    ls_sql+=" and cw_jryjkh.dwbh=b.dwbh(+)";
    ls_sql+=" and cw_jryjkh.zw=dm_zwbm.zwbm(+)";
    ls_sql+=" and cw_jryjkh.sfkh='N'";//N��δ���ˣ�Y������
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jryjkh.khzq,cw_jryjkh.fgsbh,cw_jryjkh.dwbh,cw_jryjkh.zw,cw_jryjkh.yhmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jryjkhList.jsp","","","EditCw_jryjkh.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzq","cw_jryjkh_khqssj","cw_jryjkh_khjzsj","cw_jryjkh_fgsbh","dwbh","sq_dwxx_dwmc","yhmc","cw_jryjkh_zw","cw_jryjkh_byrw","cw_jryjkh_byqds","cw_jryjkh_byyj","cw_jryjkh_dzkhbl","cw_jryjkh_lrr","cw_jryjkh_lrsj","cw_jryjkh_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khzq","dwbh","yhmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_jryjkhList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_jryjkh where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ҵ������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">��������</td>
	<td  width="6%">������ʼʱ��</td>
	<td  width="6%">���˽���ʱ��</td>
	<td  width="8%">�ֹ�˾</td>
	<td  width="5%">��������</td>
	<td  width="8%">��������</td>
	<td  width="5%">����</td>
	<td  width="6%">ְ��</td>
	<td  width="7%">��������</td>
	<td  width="5%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="65%">��ע</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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
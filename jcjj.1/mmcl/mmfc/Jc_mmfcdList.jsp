<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT jc_mmfcd.xh xh,mmdglxmc,mlxmc,DECODE(jc_mmfcd.dsk,'1','����','2','˫��') dsk,jc_mmfcd.mmxh,mmczmc,czmc,azwzmc,kqfxmc,TO_CHAR(jc_mmfcd.tjx) tjx,jc_blbj.blxh, DECODE(jc_mmfcd.ctbs,'3','����','4','�ı�') ctbs,dczlmc,TO_CHAR(jc_mmfcd.dbh) dbh,jc_mmfcd.mdk||'��'||jc_mmfcd.mdg||'��'||jc_mmfcd.qh md ,DECODE(sfsmjcc,'Y','��ľ���ɲ�','N','����ľ���ɲ�') sfsmjcc,DECODE(sfydc,'Y','�ж���','N','�޶���') sfydc,jc_mmfcd.sl,TO_CHAR(jc_mmfcd.dj) dj,sl*dj zj,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=100>' zp,jc_mmfcd.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmfcd,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb  ";
    ls_sql+=" where jc_mmfcd.blxhbm=jc_blbj.blxhbm(+) and jc_mmfcd.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmfcd.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmfcd.czbm=dm_czbm.czbm(+) and jc_mmfcd.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmfcd.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmfcd.blxhbm=jc_blbj.blxhbm(+)";
	ls_sql+=" and jc_mmfcd.mmxh=jc_mmxhb.mmxh(+) and jc_mmfcd.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmfcd.mlx=jdm_mlx.mlx(+) and jc_mmfcd.yddbh='"+yddbh+"'";
    ls_sql+=" and jc_blbj.dqbm(+)='"+dqbm+"' and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmfcd.xh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmfcdList.jsp?yddbh="+yddbh,"","","EditJc_mmfcd.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("¼��");
//������ʾ��
	String[] disColName={"mmdglxmc","mlxmc","mmxh","dsk","mmczmc","czmc","azwzmc","kqfxmc","dczlmc","dbh","md","tjx","blxh","ctbs","sfsmjcc","sfydc","sl","zp","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);

/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">ľ�Ÿ��ⵥ�����ţ�<%=yddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(145);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">��������</td>
	<td  width="4%">������</td>
	<td  width="3%">ľ���ͺ�</td>
	<td  width="3%">��˫��</td>
	<td  width="7%">��ɫ</td>
	<td  width="3%">����</td>
	<td  width="4%">��װλ��</td>
	<td  width="4%">��������</td>
	<td  width="4%">�ز�����</td>
	<td  width="3%">�زĺ�</td>
	<td  width="8%">�Ŷ�����ߡ�ǽ��</td>
	<td  width="4%">�߽���</td>
	<td  width="7%">�����ͺ�</td>
	<td  width="4%">���ױ���</td>
	<td  width="4%">����/�ƿڲ���</td>
	<td  width="4%">�Ƿ��ж���</td>
	<td  width="3%">��������</td>
	<td  width="8%">��Ƭ</td>
	<td  width="10%">��ע</td>
</tr>

<%
	pageObj.displayDate();
	pageObj.printSum();
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